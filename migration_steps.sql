-- Employee Attendance Management System
-- Phase 2: Data Migration Steps

USE employee_attendance_db;

-- Roles and Users tables are created by SQLAlchemy
-- using Base.metadata.create_all(bind=engine).

-- Step 1: Add User_Id and Manager_Id to Employees.
-- ALTER TABLE Employees
-- ADD COLUMN User_Id INT NULL UNIQUE,
-- ADD COLUMN Manager_Id INT NULL;

-- Step 2: Add leave review tracking columns.
-- ALTER TABLE Leave_Requests
-- ADD COLUMN Reviewed_By INT NULL,
-- ADD COLUMN Reviewed_At DATETIME NULL;

-- Step 3: Add active account status to Users.
-- ALTER TABLE Users
-- ADD COLUMN Is_Active BOOLEAN NOT NULL DEFAULT TRUE;

-- Step 4: Insert default roles.
-- INSERT INTO Roles (Role_Name)
-- VALUES ('Admin'), ('manager'), ('employee');

-- Step 5: Migrate existing employees into Users.
-- Only employees with non-empty email addresses are migrated.
-- MIGRATED_NO_PASSWORD is a placeholder, not a valid password hash.
--
-- INSERT INTO Users
--     (Full_Name, Email, Phone, Password_hash, Role_Id, Is_Active)
-- SELECT
--     COALESCE(
--         NULLIF(TRIM(e.Employee_Name), ''),
--         CONCAT('Employee ', e.Employee_Id)
--     ),
--     LOWER(TRIM(e.Email)),
--     e.Phone,
--     'MIGRATED_NO_PASSWORD',
--     (
--         SELECT Role_Id
--         FROM Roles
--         WHERE LOWER(Role_Name) = 'employee'
--         LIMIT 1
--     ),
--     1
-- FROM Employees e
-- WHERE e.Email IS NOT NULL
--   AND TRIM(e.Email) <> ''
--   AND NOT EXISTS (
--       SELECT 1
--       FROM Users u
--       WHERE LOWER(TRIM(u.Email)) = LOWER(TRIM(e.Email))
--   );

-- Step 6: Link existing Employees records to Users by email.
-- UPDATE Employees e
-- JOIN Users u
--   ON LOWER(TRIM(e.Email)) = LOWER(TRIM(u.Email))
-- SET e.User_Id = u.User_Id
-- WHERE e.Employee_Id > 0;

-- Step 7: Add foreign-key constraints.
-- ALTER TABLE Employees
-- ADD CONSTRAINT fk_employee_user
-- FOREIGN KEY (User_Id) REFERENCES Users(User_Id);

-- ALTER TABLE Employees
-- ADD CONSTRAINT fk_employee_manager
-- FOREIGN KEY (Manager_Id) REFERENCES Users(User_Id);

-- Step 8: Verify the database structure and migrated data.

SHOW TABLES;

DESCRIBE Employees;
DESCRIBE Leave_Requests;

SELECT * FROM Roles;

SELECT User_Id, Full_Name, Email, Role_Id, Is_Active
FROM Users
ORDER BY User_Id;

SELECT Employee_Id, Employee_Name, Email,
       User_Id, Department, Designation, Manager_Id
FROM Employees
ORDER BY Employee_Id;

SELECT Leave_Id, Status, Reviewed_By, Reviewed_At
FROM Leave_Requests
ORDER BY Leave_Id;