from selenium import webdriver


def before_all(context):
    """Setup before all tests"""
    context.config.setup_logging()


def after_all(context):
    """Cleanup after all tests"""
    pass


def before_scenario(context, scenario):
    """Setup before each scenario"""
    # Driver will be initialized in the steps
    pass


def after_scenario(context, scenario):
    """Cleanup after each scenario"""
    # Close the browser if it wasn't closed in the test
    if hasattr(context, 'driver'):
        try:
            context.driver.quit()
        except Exception:
            pass
