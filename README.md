# Employee Attendance Management System

## 1. Project Description

The Employee Attendance Management System is a web-based application developed using Python, FastAPI, MySQL, SQLAlchemy, HTML, CSS, and JavaScript.

The application helps organizations manage employee information, attendance records, and leave requests. It provides role-based access for Admins, Managers, and Employees.

## 2. Technologies Used

**Backend**
1. Python
2. FastAPI
3. MySQL
4. SQLAlchemy
5. PyMySQL
6. Pydantic
7. Uvicorn
8. pwdlib (Password Hashing)

**Frontend**
1. HTML
2. CSS
3. JavaScript

## 3. Project Structure

```text
employee_attendance_management/
│
├── frontend/
│   ├── index.html
│   ├── style.css
│   └── scripts.js
│
├── main.py
├── database.py
├── models.py
├── schemas.py
├── employee_attendance_management.sql
├── migrtaion_steps.sql
├── requirements.txt
├── security.py
├── seed_admin.py
└── README.md
```

## 4. Features

### Admin
- Login and logout
- Create Managers
- register employees
- View all Employees
- Search Employees by ID
- Update Employee details
- Delete Employees
- View all Attendance records
- View Attendance by Employee ID
- View all Leave records
- deactivate account

### Manager
- Login and logout
- View assigned Employees
- mark attendance to assiged employees
- View assigned Employee details
- View assigned Employees' Attendance
- Search Attendance by Employee ID
- update attendance
- delete attendance
- View pending Leave requests
- Approve or reject Leave requests

### Employee
- Employee registration
- Login and logout
- View personal Profile
- View personal Attendance
- Apply for Leave
- View Leave status
- Update pending Leave requests
- Delete pending Leave requests

## 5. Authentication and Authorization

- JWT-based authentication
- Access tokens and refresh tokens
- Password hashing for secure password storage
- Role-Based Access Control (RBAC)
- Protected API endpoints
- Session management and logout
- Manual session refresh

## 6. Setup Instructions

### Step 1: Install Prerequisites

Install the following software:

- Python
- MySQL Server
- MySQL Workbench
- Visual Studio Code

### Step 2: Open the Project

1. Open the `employee_attendance_management` folder in Visual Studio Code.
2. Open the terminal using **Terminal → New Terminal**.

### Step 3: Create a Virtual Environment

Run:

```powershell
python -m venv venv
```

### Step 4: Activate the Virtual Environment

Run:

```powershell
.\venv\Scripts\Activate
```

### Step 5: Install Dependencies

Run:

```powershell
pip install -r requirements.txt
```

### Step 6: Configure the MySQL Database

1. Start MySQL Server.
2. Open MySQL Workbench and connect to your MySQL server.
3. Open `employee_attendance_management.sql`.
4. Execute the SQL script to create the database and tables and insert sample data.
5. Verify that the `employee_attendance_db` database and required tables exist.

### Step 7: Configure the Database Connection

Open `database.py` and verify the database connection URL and credentials.

## 7. Execution Steps

### Step 1: Start the FastAPI Application

Run:

```powershell
uvicorn main:app --reload
```

### Step 2: Open Swagger UI

Open the following URL in your browser:

http://127.0.0.1:8000/docs

Swagger UI provides an interactive interface for testing API endpoints.

### Step 3: Run the Frontend

1. Open `frontend/index.html` in Visual Studio Code.
2. Right-click the file.
3. Select **Open with Live Server**.

**Frontend URL:**

http://127.0.0.1:5500/index.html

## 8. Database Verification

Open MySQL Workbench and execute the following queries to verify the stored data:

```sql
USE employee_attendance_db;

SELECT * FROM Employees;

SELECT * FROM Attendance;

SELECT * FROM Leave_Requests;

SELECT * FROM Roles;

SELECT * FROM Users;
```

## 9. Stopping the Application

To stop the running FastAPI server, return to the VS Code terminal and press:

`CTRL + C`

## 10. Conclusion

The Employee Attendance Management System helps manage employee details, attendance, and leave requests in one place. It provides different access for Admins, Managers, and Employees. This project helped me gain practical knowledge of Python, FastAPI, MySQL, SQLAlchemy, and frontend development.