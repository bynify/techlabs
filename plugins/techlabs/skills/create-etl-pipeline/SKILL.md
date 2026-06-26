# create-etl-pipeline

Build ETL pipeline for data extraction, transformation, and loading.

## When to Use
- Data warehouse loading
- Analytics processing
- Data migration
- Reporting pipelines

## Execution

### Step 1: Define Pipeline
```python
# etl/pipeline.py
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'data-team',
    'retries': 3,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='user_metrics_daily',
    default_args=default_args,
    schedule='0 2 * * *',
    start_date=datetime(2024, 1, 1),
    catchup=False,
) as dag:
    extract = PythonOperator(task_id='extract', python_callable=extract_data)
    transform = PythonOperator(task_id='transform', python_callable=transform_data)
    load = PythonOperator(task_id='load', python_callable=load_to_warehouse)
    
    extract >> transform >> load
```

### Step 2: Extract
```python
def extract_data(**context):
    """Extract data from source systems."""
    df = pd.read_sql(
        "SELECT * FROM orders WHERE created_at > %s",
        source_db,
        params=[context['execution_date']]
    )
    context['task_instance'].xcom_push(key='raw_data', value=df.to_dict())
    return len(df)
```

### Step 3: Transform
```python
def transform_data(**context):
    """Clean and transform data."""
    raw = context['task_instance'].xcom_pull(task_ids='extract', key='raw_data')
    df = pd.DataFrame(raw)
    
    # Clean
    df = df.dropna()
    df['created_date'] = pd.to_datetime(df['created_at']).dt.date
    df['total'] = df['quantity'] * df['price']
    
    # Validate
    assert df['total'].ge(0).all(), "Negative totals found"
    assert len(df) > 0, "Empty dataset"
    
    context['task_instance'].xcom_push(key='transformed', value=df.to_dict())
    return len(df)
```

### Step 4: Load
```python
def load_to_warehouse(**context):
    """Load data into warehouse."""
    data = context['task_instance'].xcom_pull(task_ids='transform', key='transformed')
    df = pd.DataFrame(data)
    
    df.to_sql(
        'fact_orders',
        warehouse_db,
        if_exists='append',
        index=False,
        method='multi',
    )
    return len(df)
```

### Step 5: Add Quality Checks
```python
def validate_pipeline(**context):
    """Post-load validation."""
    count = warehouse_db.execute("SELECT COUNT(*) FROM fact_orders WHERE date = %s", [date])
    assert count > 0, "No data loaded"
    
    duplicates = warehouse_db.execute("""
        SELECT order_id, COUNT(*) FROM fact_orders
        WHERE date = %s GROUP BY 1 HAVING COUNT(*) > 1
    """, [date])
    assert duplicates == 0, "Duplicate records found"
```

## Output
- DAG definition
- Extract/transform/load functions
- Quality checks
- Error handling
- Retry configuration
