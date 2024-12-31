<h2>Demo Register at Melaka App using Robot-Framework Selenium</h2> 
This repository demonstrates automated testing for the registration functionality of the Melaka App using Robot Framework with SeleniumLibrary.

<h3>Getting Started with Robot-Framework</h3>

**Need to install on Mac / Windows :**
- Python version 3
- Robot-Framework
- vsCode / Pycharm / intelliJ

**How To Install Robot-Framework :**

After you installed Python, you need to run this command on terminal and wait for the installation  to finished
```
pip3 install robotframework
```


**Robot-Framework Library :**<br>
Libraries that needs to be installed for Melaka App Robot-Framework Automation project
```            
robotframework-seleniumlibrary 
```
To install this libraries you need to use terminal, and use this command <br>

Command for Python3

```
pip3 install robot-framework {libraryName}
```

To check if Robot-Framework is correctly installed, you can use this command
```
pip3 list
```

<h3>How to run Robot-Framework Test :</h3>
Go into the `TEST_CASES` directory, then you need to get the test case file directory <br><br>

For example, directory for `smokeTestRegister.robot` file is :<br>

```
TEST_CASES/REGISTER_POSITIVE_CASE/smokeTestRegister.robot 
```


Then you need to run this command on your terminal to run Robot-Framework

```
robot {test_case_directory}
```

For Example

```
robot TEST_CASES/REGISTER_POSITIVE_CASE/smokeTestRegister.robot 
```

<h3>Robot-Framework Test Results</h3>
After robot automation finished it test, it will automatically generate the test results that you can open on your browser<br><br>
Sample Results on Terminal :

```
smokeTestRegister                                                     | PASS |
7 tests, 7 passed, 0 failed
==============================================================================
Output:  /Users/cikadasayyidilakbar/Documents/robot_melakaapp_demo/robot_selenium_melakaapp/output.xml
Log:     /Users/cikadasayyidilakbar/Documents/robot_melakaapp_demo/robot_selenium_melakaapp/log.html
Report:  /Users/cikadasayyidilakbar/Documents/robot_melakaapp_demo/robot_selenium_melakaapp/report.html
```
