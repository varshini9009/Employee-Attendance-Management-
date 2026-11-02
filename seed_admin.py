import os
from dotenv import load_dotenv
from database import sessionlocal
import models
from security import hash_password

load_dotenv()

db = sessionlocal()

try:
    admin_role = db.query(models.Role).filter(
        models.Role.Role_Name == "Admin"
    ).first()

    if not admin_role:
        raise ValueError("Admin role not found. Check the Roles table.")

    existing_admin = db.query(models.User).filter(
        models.User.Role_Id == admin_role.Role_Id
    ).first()

    if existing_admin:
        print("Admin account already exists.")
    else:
        admin = models.User(
            Full_Name=os.getenv("ADMIN_NAME"),
            Email=os.getenv("ADMIN_EMAIL"),
            Phone=os.getenv("ADMIN_PHONE"),
            Password_hash=hash_password(os.getenv("ADMIN_PASSWORD")),
            Role_Id=admin_role.Role_Id,
            Must_Change_Password=True
        )
        db.add(admin)
        db.commit()
        print("Admin created successfully.")

except Exception:
    db.rollback()
    raise

finally:
    db.close()
 