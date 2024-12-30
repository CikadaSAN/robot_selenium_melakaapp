*** Settings ***
Library      SeleniumLibrary
Library      String
Library      BuiltIn

*** Keywords ***
Generate Random User
    ${randomABC}    Generate Random String    4    [LOWER]
    Set Global Variable    ${randomName}    user qa ${randomABC}
    Set Global Variable    ${randomEmail}   qa_${randomABC}@testacc.com
    Set Global Variable    ${randomBusiness}    QA Store ${randomABC}
    Log To Console    Random Full Name: ${randomName} | Random Emai: ${randomEmail} | Random Business : ${randomBusiness}

Generate Random Phone Number
    ${randomNUM}    Generate Random String    5    [NUMBERS]
    Set Global Variable    ${randomPhone}    000111${randomNUM}
    Log To Console    Random Phone Number : ${randomPhone}