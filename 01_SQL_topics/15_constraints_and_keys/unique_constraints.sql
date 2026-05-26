USE nova_retail;

-- =========================================
-- UNIQUE CONSTRAINTS
-- =========================================

-- Table with unique constraint
CREATE TABLE users_unique_demo (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    username VARCHAR(50)
);

-- Insert data
INSERT INTO users_unique_demo
VALUES
(1, 'john@example.com', 'johnsmith'),
(2, 'emma@example.com', 'emmaj');

-- View data
SELECT *
FROM users_unique_demo;