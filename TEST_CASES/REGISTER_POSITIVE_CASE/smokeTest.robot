*** Settings ***
Library  SeleniumLibrary
Variables    ../../RESOURCES/LOCATOR/xpathRegisterPage.py
Resource     ../../RESOURCES/KEYWORDS/openMelakaApp.robot
Resource     ../../RESOURCES/KEYWORDS/registerPageKeywords.robot
Resource     ../../RESOURCES/KEYWORDS/randomizeVariable.robot
Resource    ../../RESOURCES/VARIABLES/testingVariables.robot

*** Test Cases ***
Open Register Page
    Open MelakaAPP Register Page
    Check Register Page UI Wording
    
Check & Input Field Name
    Generate Random User
    Validate Input Name Field
    Input Name Field

Check & Input Phone Number
    Generate Random Phone Number
    Validate Input Phone Field
    Input Phone Number Field

Check & Select Business Type
    Validate Business Type Radio Button
    Select Business Type
