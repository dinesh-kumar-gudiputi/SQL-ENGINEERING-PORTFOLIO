USE nova_retail;

-- =========================================
-- CLUSTERED VS NONCLUSTERED INDEXES
-- =========================================

-- Clustered index concept
-- Primary keys automatically create clustered indexes in many databases

CREATE TABLE clustered_demo (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    total_amount DECIMAL(10,2)
);

-- Nonclustered index
CREATE INDEX idx_customer_name
ON clustered_demo(customer_name);

-- Sample data
INSERT INTO clustered_demo
VALUES
(1, 'John Smith', 1200),
(2, 'Emma Johnson', 800);

-- Query using index
SELECT *
FROM clustered_demo
WHERE customer_name = 'John Smith';