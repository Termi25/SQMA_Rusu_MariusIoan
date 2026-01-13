pipeline {
    agent any
    
    environment {
        VENV_DIR = 'venv'
     	PYTHON_EXE = "${WORKSPACE}\\venv\\Scripts\\python.exe"
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        
        stage('Setup Environment') {
            steps {
                echo 'Installing Python dependencies...'
                bat """
                    "${PYTHON_EXE}" -m pip install --user -r tests\\requirements.txt
                """
            }
        }
        
        stage('Start Web Server') {
            steps {
                echo 'Starting HTTP server on port 8000...'
                bat """
                    start /B "" "${PYTHON_EXE}" -m http.server 8000
                    ping 127.0.0.1 -n 6 > nul
                """
            }
        }
        
        stage('Run All Tests') {
            parallel {
                stage('Test 1: Sepia Effect') {
                    steps {
                        echo 'Running Sepia Effect Test...'
                        bat """
                            "${PYTHON_EXE}" -m behave tests\\photo_editor_t1.feature --junit --junit-directory test-results\\sepia
                        """
                    }
                }
                
                stage('Test 2: Add Text') {
                    steps {
                        echo 'Running Add Text Test...'
                        bat """
                            "${PYTHON_EXE}" -m behave tests\\photo_editor_t2.feature --junit --junit-directory test-results\\text
                        """
                    }
                }
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up processes...'
            bat """
                taskkill /F /IM python.exe || exit 0
                taskkill /F /IM chrome.exe || exit 0
                taskkill /F /IM chromedriver.exe || exit 0
            """
            
            // Publish test results
            junit allowEmptyResults: true, testResults: 'test-results/**/*.xml'
            
            // Archive test results
            archiveArtifacts artifacts: 'test-results/**/*.xml', allowEmptyArchive: true
        }
        success {
            echo '✓ All tests passed successfully!'
        }
        failure {
            echo '✗ Some tests failed!'
        }
    }
}