# Utility functions for data conversion and filtering
# utils.py
# Utility functions for data conversion, filtering, and calculations

def convert_currency(amount, target_currency="NGN", rate=None):
    """
    Convert USD to target currency with an optional custom rate.
    Default: 1 USD = ₦1500.
    """
    default_rates = {
        "NGN": 1500.0,
        #"EUR": 0.9,
        #"GBP": 0.78,
    }
    rate = rate or default_rates.get(target_currency.upper(), 1)
    return round(amount * rate, 2)

def apply_discount(price, quantity, threshold=5, discount_rate=0.1):
    """Apply a discount if quantity meets or exceeds the threshold."""
    if quantity >= threshold:
        return round(price * (1 - discount_rate), 2)
    return price

def is_large_order(total, threshold=100):
    """Flag orders where total value exceeds threshold."""
    return total > threshold

def calculate_order_total(price, quantity):
    """Compute the total value of an order."""
    return round(price * quantity, 2)
