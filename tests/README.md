# Photo Editor Behave Tests

This folder contains automated tests for the Photo Editor web application using Python Behave (BDD framework) and Selenium.

## Test Scenarios

1. **Apply sepia effect and download image** - Tests uploading an image, applying sepia effect, and downloading
2. **Add text to image and download** - Tests uploading an image, applying sepia effect, adding text, and downloading

## Prerequisites

1. Python 3.7 or higher
2. Chrome browser installed
3. ChromeDriver (will be managed automatically by webdriver-manager)

## Installation

1. Install the required dependencies:
```bash
pip install -r requirements.txt
```

## Running the Tests

1. Start a local web server in the project root directory:
```bash
python -m http.server 8000
```

2. In a new terminal, navigate to the project root and run the tests:
```bash
behave tests
```

Or run with verbose output:
```bash
behave tests -v
```

## Test Structure

- `photo_editor.feature` - Contains the test scenarios written in Gherkin syntax
- `steps/photo_editor_steps.py` - Contains the step definitions (Python code)
- `environment.py` - Contains setup and teardown hooks
- `requirements.txt` - Lists the Python dependencies

## Notes

- Make sure the `PlushiesGG.PNG` file exists in the `media` folder
- The tests expect the HTML file to be served at `http://localhost:8000/4_1095_RUSU_MariusIoan.html`
- The browser will close automatically after the second test completes
