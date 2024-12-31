*** Settings ***
Library      SeleniumLibrary
Library      String
Library      BuiltIn

Variables    ../../RESOURCES/LOCATOR/xpathRegisterPage.py
Resource     ../../RESOURCES/KEYWORDS/openMelakaApp.robot
Resource     ../../RESOURCES/KEYWORDS/registerPageKeywords.robot
Resource     ../../RESOURCES/KEYWORDS/randomizeVariable.robot
Resource    ../../RESOURCES/VARIABLES/testingVariables.robot

*** Test Cases ***
Open Register Page
    Open MelakaAPP Register Page
    Check Register Page UI Wording

Input Name Field with Invalid Format
    Input Name Field Invalid
    
Input Phone Number Field Invalid Format
    Input Phone Number Field Invalid

Input Business Name Field Invalid Format
    Input Business Name Field Invalid

Input Email Field with Invalid Format
    Input Email Field Invalid

Input Password Field with Invalid Format
    Input Password Field Invalid

Input Confirmation Password with Missmatch Password
    Input Password Field
    Input Confirm Password Field