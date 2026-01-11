# Photo Editor Behave Tests

This folder contains automated tests for the Photo Editor web application using Python Behave (BDD framework) and Selenium.

## Test Scenarios

1. **Apply sepia effect and download image** (`photo_editor_t1.feature`) - Tests uploading an image, applying sepia effect, and downloading
2. **Add text to image and download** (`photo_editor_t2.feature`) - Tests uploading an image, adding text, and downloading

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

### Locally

1. Start a local web server in the project root directory:
```bash
python -m http.server 8000
```

2. In a new terminal, navigate to the project root and run the tests:
```bash
# Run all tests
behave tests

# Run specific test
behave tests/photo_editor_t1.feature
behave tests/photo_editor_t2.feature
```

### Jenkins CI/CD

This project includes a `Jenkinsfile` for automated testing:

1. Create a Pipeline job in Jenkins
2. Configure it to use **"Pipeline script from SCM"**
3. Point to this GitHub repository
4. Jenkins will automatically detect and run the `Jenkinsfile`

The pipeline will:
- Install dependencies
- Start the web server
- Run both tests in parallel
- Publish test results
- Clean up processes

## Test Structure

- `photo_editor_t1.feature` - Sepia effect test scenario
- `photo_editor_t2.feature` - Add text test scenario
- `steps/photo_editor_steps.py` - Step definitions (Python code)
- `environment.py` - Setup and teardown hooks
- `requirements.txt` - Python dependencies

## Notes

- Make sure the `PlushiesGG.PNG` file exists in the `media` folder
- The tests expect the HTML file to be served at `http://localhost:8000/4_1095_RUSU_MariusIoan.html`
- The browser will close automatically after each test completes