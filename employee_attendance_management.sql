create database if not exists
employee_attendance_db;
use employee_attendance_db;
show tables;
select*from employees;
select*from attendance;
select*from leave_requests;
select*from roles;
select*from users;
describe employees;
describe leave_requests;
select*from revoked_tokens;

alter table employees
add column User_Id int null unique,
add column Manager_Id int null;

alter table leave_requests
add column Reviewed_By int null,
add column Reviewed_At datetime null;

alter table Users
add column Is_Active boolean not null default true;

ALTER TABLE Users
ADD COLUMN Must_Change_Password BOOLEAN NOT NULL DEFAULT FALSE;

insert into roles(role_name)
values('Admin'),('manager'),('employee');

UPDATE Users
SET Must_Change_Password = TRUE
WHERE Email = 'admin@gmail.com';

INSERT INTO Users
    (Full_Name, Email, Phone, Password_hash, Role_Id, Is_Active)
SELECT
    COALESCE(NULLIF(TRIM(e.Employee_Name), ''), CONCAT('Employee ', e.Employee_Id)),
    LOWER(TRIM(e.Email)),
    e.Phone,
    'MIGRATED_NO_PASSWORD',
    (SELECT Role_Id FROM Roles WHERE LOWER(Role_Name) = 'employee' LIMIT 1),
    1
FROM Employees e
WHERE e.Email IS NOT NULL
  AND TRIM(e.Email) <> ''
  AND NOT EXISTS (
      SELECT 1 FROM Users u
      WHERE LOWER(TRIM(u.Email)) = LOWER(TRIM(e.Email))
  );


SELECT User_Id, Full_Name, Email, Role_Id
FROM Users
WHERE LOWER(Email) IN (
    SELECT LOWER(TRIM(Email))
    FROM Employees
);


SET SQL_SAFE_UPDATES = 0;

UPDATE Employees e
JOIN Users u
  ON LOWER(TRIM(e.Email)) = LOWER(TRIM(u.Email))
SET e.User_Id = u.User_Id
WHERE e.Employee_Id > 0;

SELECT Employee_Id, Employee_Name, Email, User_Id
FROM Employees;

SELECT
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'employee_attendance_db'
  AND TABLE_NAME = 'Employees'
  AND REFERENCED_TABLE_NAME IS NOT NULL;
  
ALTER TABLE Employees
ADD CONSTRAINT fk_employee_user
FOREIGN KEY (User_Id) REFERENCES Users(User_Id);

ALTER TABLE Employees
ADD CONSTRAINT fk_employee_manager
FOREIGN KEY (Manager_Id) REFERENCES Users(User_Id);


SELECT Employee_Id, User_Id, Department, Designation, Manager_Id
FROM Employees
ORDER BY Employee_Id DESC
LIMIT 1;

SELECT User_Id, Full_Name, Email, Role_Id
FROM Users
ORDER BY User_Id DESC
LIMIT 1;


SHOW COLUMNS FROM Leave_Requests;
DESCRIBE Leave_Requests;
SELECT Leave_Id, Status, Reviewed_By, Reviewed_At
FROM Leave_Requests
WHERE Leave_Id = 10;
SELECT Leave_Id, Status, Reviewed_By, Reviewed_At
FROM Leave_Requests
ORDER BY Leave_Id DESC;


ALTER TABLE Revoked_Tokens
ADD COLUMN Session_Id VARCHAR(100) NULL;

ALTER TABLE Revoked_Tokens
MODIFY COLUMN Token_JTI VARCHAR(100) NULL;


SELECT
    Expires_At AS Stored_UTC,
    DATE_ADD(Expires_At, INTERVAL 330 MINUTE) AS Display_IST
FROM Revoked_Tokens;





