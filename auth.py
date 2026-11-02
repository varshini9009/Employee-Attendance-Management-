import jwt
from datetime import datetime, timedelta, timezone
import uuid
import os
from dotenv import load_dotenv

load_dotenv()

SECRET_KEY = os.getenv("SECRET_KEY")
ALGORITHM="HS256"
ACCESS_TOKEN_EXPIRE_MINUTES=30
REFRESH_TOKEN_EXPIRE_DAYS=7


# token-generation functions

def create_access_token(data:dict):
    to_encode=data.copy()
    expire=datetime.now(timezone.utc)+timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode.update({"exp":expire,"type":"access"})
    to_encode.update({"jti": uuid.uuid4().hex})
    return jwt.encode(to_encode,SECRET_KEY,algorithm=ALGORITHM)

# refresh-token function
def create_refresh_token(data: dict):
    to_encode=data.copy()
    expire=datetime.now(timezone.utc)+timedelta(days=REFRESH_TOKEN_EXPIRE_DAYS)
    to_encode.update({"exp":expire,"type":"refresh"})
    to_encode.update({"jti": uuid.uuid4().hex})
    return jwt.encode(to_encode,SECRET_KEY,algorithm=ALGORITHM)
