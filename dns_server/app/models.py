from . import db
from sqlalchemy.dialects.postgresql import INET
from sqlalchemy.sql import func

class Category(db.Model):
    __tablename__ = "category"
    id = db.Column(db.SmallInteger, primary_key=True)
    name = db.Column(db.Text, unique=True, nullable=False)

    webs = db.relationship("Web", back_populates="category")

class Web(db.Model):
    __tablename__ = "web"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, unique=True, nullable=False)
    category_id = db.Column(db.Integer, db.ForeignKey("category.id", ondelete="CASCADE"))

    category = db.relationship("Category", back_populates="webs")
    domains = db.relationship("Domain", back_populates="web")
    logs = db.relationship("Log", back_populates="web")

class Domain(db.Model):
    __tablename__ = "domain"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.Text, unique=True, nullable=False)
    web_id = db.Column(db.Integer, db.ForeignKey("web.id", ondelete="CASCADE"))

    web = db.relationship("Web", back_populates="domains")

class Log(db.Model):
    __tablename__ = "log"
    id = db.Column(db.Integer, primary_key=True)
    web_id = db.Column(db.Integer, db.ForeignKey("web.id", ondelete="SET NULL"), nullable=True)
    ip_address = db.Column(INET, nullable=False)
    accessed_at = db.Column(db.DateTime(timezone=True), server_default=func.now())

    web = db.relationship("Web", back_populates="logs")
