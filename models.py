from sqlalchemy import Column,Integer,String,Date,ForeignKey,DateTime,Boolean
from database import Base
from datetime import date
from sqlalchemy.sql import func
from sqlalchemy.orm import relationship
class Employee(Base):
    __tablename__="Employees"
    Employee_Id=Column(Integer,primary_key=True,autoincrement=False)
    User_Id=Column(Integer,ForeignKey("Users.User_Id"),unique=True,nullable=True)
    Manager_Id=Column(Integer,ForeignKey("Users.User_Id"),nullable=True)
    Employee_Name=Column(String(100))
    Email=Column(String(100))
    Phone=Column(String(15))
    Department=Column(String(100))
    Designation=Column(String(100))

class Attendance(Base):
    __tablename__="Attendance"
    Attendance_Id=Column(Integer,primary_key=True)
    Employee_Id=Column(Integer,ForeignKey("Employees.Employee_Id"))
    Attendance_Date=Column(Date,default=date.today)  
    Status=Column(String(50))  

class LeaveRequest(Base):
    __tablename__="Leave_Requests"
    Leave_Id=Column(Integer,primary_key=True) 
    Employee_Id=Column(Integer,ForeignKey("Employees.Employee_Id"))  
    From_Date=Column(Date)
    To_Date=Column(Date) 
    Leave_Type=Column(String(50))
    Reason=Column(String(500))
    Status=Column(String(20),default="Pending",nullable=False)
    Reviewed_By=Column(Integer,ForeignKey("Users.User_Id"),nullable=True)
    Reviewed_At=Column(DateTime,nullable=True)

class Role(Base):
    __tablename__="Roles"
    Role_Id=Column(Integer,primary_key=True)
    Role_Name=Column(String(50),unique=True,nullable=False)

class User(Base):
    __tablename__="Users"
    role = relationship("Role")
    User_Id=Column(Integer,primary_key=True)
    Full_Name=Column(String(100),nullable=False)
    Email=Column(String(100),unique=True)
    Phone=Column(String(15))
    Password_hash=Column(String(200),nullable=False)
    Role_Id=Column(Integer,ForeignKey("Roles.Role_Id"),nullable=False)
    Is_Active=Column(Boolean,default=True,nullable=False)
    Created_At=Column(DateTime,server_default=func.now(),nullable=False)
    Must_Change_Password = Column(Boolean, default=False, nullable=False)


class RevokedToken(Base):
    __tablename__ = "Revoked_Tokens"
    RevokedToken_Id=Column(Integer,primary_key=True,index=True)
    Token_JTI=Column(String(100),unique=True,nullable=False,index=True)
    Session_Id=Column(String(100), nullable=True, index=True)
    Expires_At=Column(DateTime,nullable=False)
