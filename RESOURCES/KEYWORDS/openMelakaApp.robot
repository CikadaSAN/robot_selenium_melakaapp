*** Settings ***
Library  SeleniumLibrary
Variables    ../../RESOURCES/LOCATOR/xpathRegisterPage.py
Resource     ../../RESOURCES/VARIABLES/testingVariables.robot

*** Keywords *** 
Open MelakaAPP Register Page
    Open browser    ${baseUrl}/register    ${browserType}
    Wait until element is visible    ${regInputName}    30    