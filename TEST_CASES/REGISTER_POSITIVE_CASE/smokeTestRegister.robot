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

Validate Button Login
    Check Button Login    
        
Validate & Input Field Name
    Generate Random User
    Validate Input Name Field
    Input Name Field

Validate & Input Phone Number
    Generate Random Phone Number
    Validate Input Phone Field
    Input Phone Number Field

Validate & Input Business Name
    Validate Input Business Name Field
    Input Business Name Field

Validate & Select Business Type
    Validate Business Type Radio Button
    Select Business Type

Validate & Input Email
    Validate Input Email Field
    Input Email Field

Validate & Input Password
    Validate Input Password Field
    Input Password Field

Validate & Input Confirm Password
    Validate Input Confirm Password Field
    Input Confirm Password Field

Validate & Check Checkbox Accept Terms & Conditions
    Validate Checkbox Accept Terms & Conditions
    Check Checkbox Accept Terms & Conditions

Check Terms & Conditions Page
    Check URL Ketentuan Penggunaan
    Check URL Kode Etik Penjual
    Check URL Kebijakan Privasi
    Check URL Ketentuan Pembatalan dan Pengembalian

Submit New User Registration
    Submit Button Register