USE nova_retail;

-- =========================================
-- FOREIGN KEYS
-- =========================================

-- Parent table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Child table
CREATE TABLE employees_fk_demo (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,

    CONSTRAINT fk_department
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);

-- Insert sample data
INSERT INTO departments
VALUES
(1, 'Sales'),
(2, 'Finance');

INSERT INTO employees_fk_demo
VALUES
(101, 'John Smith', 1),
(102, 'Emma Johnson', 2);

-- View data
SELECT *
FROM employees_fk_demo;