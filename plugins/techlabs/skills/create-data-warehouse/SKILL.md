# create-data-warehouse

Design and implement data warehouse with star schema and ETL pipelines.

## When to Use
- Analytics infrastructure
- Business intelligence
- Historical data storage
- Reporting systems

## Execution

### Step 1: Design Schema
```sql
-- Dimension: Users
CREATE TABLE dim_users (
  user_key SERIAL PRIMARY KEY,
  user_id VARCHAR(50) UNIQUE,
  name VARCHAR(255),
  email VARCHAR(255),
  created_date DATE
);

-- Dimension: Products
CREATE TABLE dim_products (
  product_key SERIAL PRIMARY KEY,
  product_id VARCHAR(50) UNIQUE,
  name VARCHAR(255),
  category VARCHAR(100),
  price DECIMAL(10,2)
);

-- Fact: Orders
CREATE TABLE fact_orders (
  order_key SERIAL PRIMARY KEY,
  user_key INT REFERENCES dim_users(user_key),
  product_key INT REFERENCES dim_products(product_key),
  order_date DATE,
  quantity INT,
  total DECIMAL(10,2)
);
```

### Step 2: Create ETL Pipeline
```python
# etl/load_orders.py
import pandas as pd
from sqlalchemy import create_engine

def load_orders(source_db, warehouse_db):
    df = pd.read_sql("SELECT * FROM orders", source_db)
    df.to_sql('fact_orders', warehouse_db, if_exists='append', index=False)
```

## Output
- Star schema DDL
- ETL scripts
- Data quality checks
- Documentation
