
import os
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from urllib.parse import quote_plus

load_dotenv()

user = os.getenv("DB_USER")
password = quote_plus(os.getenv("DB_PASSWORD"))
host = os.getenv("DB_HOST")
port = os.getenv("DB_PORT")
database = os.getenv("DB_NAME")

DATABASE_URL = (
    f"mysql+pymysql://{user}:{password}@{host}:{port}/{database}"
)

engine = create_engine(
    DATABASE_URL,
    connect_args={"ssl": {}}
)

sessionlocal = sessionmaker(bind=engine)
Base = declarative_base()


def get_db():
    db = sessionlocal()
    try:
        yield db
    finally:
        db.close()        
            
