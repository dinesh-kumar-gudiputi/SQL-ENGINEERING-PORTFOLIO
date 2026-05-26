USE nova_retail;

-- =========================================
-- AUDIT LOGGING
-- =========================================

-- Audit log table
CREATE TABLE etl_audit_log (

    audit_id INT PRIMARY KEY AUTO_INCREMENT,

    process_name VARCHAR(100),

    process_status VARCHAR(50),

    records_processed INT,

    execution_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- INSERT AUDIT RECORDS
-- =========================================

INSERT INTO etl_audit_log (

    process_name,
    process_status,
    records_processed

)

VALUES
('Customer Data Load', 'SUCCESS', 1000),
('Product Transformation', 'SUCCESS', 500),
('Sales Pipeline Load', 'FAILED', 0);

-- =========================================
-- VIEW AUDIT LOGS
-- =========================================

SELECT *
FROM etl_audit_log
ORDER BY execution_time DESC;

-- =========================================
-- SUCCESS VS FAILURE COUNT
-- =========================================

SELECT
    process_status,
    COUNT(*) AS total_processes
FROM etl_audit_log
GROUP BY process_status;

-- =========================================
-- TOTAL RECORDS PROCESSED
-- =========================================

SELECT
    SUM(records_processed) AS total_records_loaded
FROM etl_audit_log;