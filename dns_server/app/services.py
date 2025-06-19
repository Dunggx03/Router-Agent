import os
from datetime import datetime
from flask import current_app
from sqlalchemy.orm import joinedload
from .models import db, Domain, Log, Web, Category
from .utils import best_match

UNKNOWN_LOG_FILE = "unknown_domains.log"

def process_domain_report(domain_str, ip_address):
    """
    Kiểm tra domain gửi đến có tồn tại trong bảng Domain không.
    Nếu có → ghi log vào DB và trả về matched_name.
    Nếu không → ghi domain vào file unknown_domains.log.
    """
    # Truy vấn tất cả domain trong DB (dạng string)
    all_domains = db.session.query(Domain.name).all()
    domain_names = [d[0] for d in all_domains]

    # Dùng hàm best_match để tìm domain phù hợp
    matched_name = best_match(domain_str, domain_names)

    if matched_name:
        # Lấy đối tượng domain
        domain = db.session.query(Domain).filter_by(name=matched_name).first()

        if domain:
            # Tạo log truy cập
            log = Log(web_id=domain.web_id, ip_address=ip_address)
            db.session.add(log)
            db.session.commit()
            return True, matched_name 
    else:
        # Nếu không khớp, ghi vào file
        log_line = f"{datetime.now().isoformat()} | {domain_str} | {ip_address}\n"
        with open(UNKNOWN_LOG_FILE, "a") as f:
            f.write(log_line)
        return False, domain_str  

def get_category_stats():
    """
    Trả về thống kê: tên category và số lần truy cập tương ứng.
    Dựa vào bảng log → web → category
    """
    results = (
        db.session.query(Category.name, db.func.count(Log.id))
        .join(Web, Web.category_id == Category.id)
        .join(Log, Log.web_id == Web.id)
        .group_by(Category.name)
        .order_by(db.func.count(Log.id).desc())
        .all()
    )

    return [{"category": name, "count": count} for name, count in results]
