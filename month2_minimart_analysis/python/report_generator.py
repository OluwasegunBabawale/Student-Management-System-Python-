# Code to generate dictionary summary reports
# report_generator.py
# Code to generate dictionary summary reports from SQL data

import psycopg2

def generate_report(connection):
    """Fetch data and compute summary metrics."""
    cursor = connection.cursor()

    # 1. Total products sold
    cursor.execute("SELECT SUM(quantity) FROM orders;")
    total_products_sold = cursor.fetchone()[0] or 0

    # 2. Most popular product (highest total quantity sold)
    cursor.execute("""
        SELECT p.product_name, SUM(o.quantity) AS total_goods_sold
        FROM orders o
        JOIN products p ON o.product_id = p.product_id
        GROUP BY p.product_name
        ORDER BY total_goods_sold DESC
        LIMIT 1;
    """)
    popular_product_result = cursor.fetchone()
    most_popular_product = popular_product_result[0] if popular_product_result else "N/A"

    # 3. Revenue per customer
    cursor.execute("""
        SELECT c.name, SUM(p.price * o.quantity) AS total_sales
        FROM orders o
        JOIN customers c ON o.customer_id = c.customer_id
        JOIN products p ON o.product_id = p.product_id
        GROUP BY c.name
        ORDER BY total_sales DESC;
    """)
    revenue_per_customer = {row[0]: float(row[1]) for row in cursor.fetchall()}

    cursor.close()

    # 4. Create report dictionary
    report = {
        "total_products_sold": total_products_sold,
        "most_popular_product": most_popular_product,
        "revenue_per_customer": revenue_per_customer
    }

    return report
