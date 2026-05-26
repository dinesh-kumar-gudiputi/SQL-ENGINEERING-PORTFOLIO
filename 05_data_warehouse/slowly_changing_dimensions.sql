USE nova_retail;

-- =========================================
-- SLOWLY CHANGING DIMENSIONS (SCD TYPE 2)
-- =========================================

CREATE TABLE dim_customer_scd (

    surrogate_key INT PRIMARY KEY AUTO_INCREMENT,

    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),

    effective_date DATE,
    end_date DATE,

    is_current BOOLEAN
);

-- =========================================
-- INITIAL LOAD
-- =========================================

INSERT INTO dim_customer_scd (

    customer_id,
    first_name,
    last_name,
    city,
    country,
    effective_date,
    end_date,
    is_current
)

SELECT
    customer_id,
    first_name,
    last_name,
    city,
    country,
    CURRENT_DATE(),
    NULL,
    TRUE

FROM customers;

-- =========================================
-- SIMULATED CUSTOMER CHANGE
-- =========================================

-- Customer moves city

UPDATE dim_customer_scd
SET
    end_date = CURRENT_DATE(),
    is_current = FALSE

WHERE customer_id = 1
AND is_current = TRUE;

INSERT INTO dim_customer_scd (

    customer_id,
    first_name,
    last_name,
    city,
    country,
    effective_date,
    end_date,
    is_current
)

VALUES (
    1,
    'John',
    'Smith',
    'Munich',
    'Germany',
    CURRENT_DATE(),
    NULL,
    TRUE
);

-- =========================================
-- VIEW HISTORY
-- =========================================

SELECT *
FROM dim_customer_scd
ORDER BY customer_id, effective_date;