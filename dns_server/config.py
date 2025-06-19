import os

class Config:
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL", "postgresql://postgres:Anhdung03@localhost:5432/test")
    SQLALCHEMY_TRACK_MODIFICATIONS = False
