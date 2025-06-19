from flask import Blueprint, request, render_template, jsonify
from .services import process_domain_report, get_category_stats

bp = Blueprint("main", __name__)

@bp.route("/report", methods=["POST"])
def report():
    data = request.json
    domain = data.get("domain")
    ip = data.get("ip")

    if not domain or not ip:
        return jsonify({"error": "Missing fields"}), 400

    found, matched_domain = process_domain_report(domain, ip)
    return jsonify({"matched": found, "domain": matched_domain}), 200

@bp.route("/")
@bp.route("/dashboard")
def dashboard():
    stats = get_category_stats()
    categories = [r["category"] for r in stats]
    counts = [r["count"] for r in stats]
    return render_template("dashboard.html", categories=categories, counts=counts)
