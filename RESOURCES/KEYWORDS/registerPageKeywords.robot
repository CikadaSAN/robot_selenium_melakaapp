*** Settings ***
Library      SeleniumLibrary
Library      String
Library      BuiltIn

Variables    ../../RESOURCES/LOCATOR/xpathRegisterPage.py
Variables    ../../RESOURCES/LOCATOR/wordingRegisterPage.py
Resource     ../../RESOURCES/KEYWORDS/randomizeVariable.robot

*** Keywords ***
Check Register Page UI Wording
    Wait Until Element Is Visible    ${regInputName}
    Page Should Contain    ${titleRegister}
    Page Should Contain    ${descRegister}

    Page Should Contain Textfield    ${regInputName}
    Page Should Contain Textfield    ${regInputPhone}
    Page Should Contain Textfield    ${regInputBusinessName}
    Page Should Contain Textfield    ${regInputEmail}
    
    Page Should Contain Radio Button    ${radioTypeBrand}
    Page Should Contain Radio Button    ${radioTypeDistributor}
    Page Should Contain Radio Button    ${radioTypeOnline}
    Page Should Contain Radio Button    ${radioTypeRetail}

    Scroll Element Into View       ${buttonLogin}
    Page Should Contain Element    ${regInputPass}
    Page Should Contain Element    ${regInputConfirmPass}
    Page Should Contain Element    ${checkboxTnC}
    Page Should Contain Element    ${buttonSubmit}
    Page Should Contain Element    ${buttonLogin}
    Execute JavaScript    window.scrollTo(0, 0)
    Page Should Contain Element   ${regInputName}

Validate Input Name Field
    Element Should Be Visible    ${regInputName}
    Element Should Be Visible     ${helperInputName}
    Element Text Should Be        ${helperInputName}    ${labelFieldName}

Input Name Field
    Generate Random User
    Input Text    ${regInputName}    ${randomName}
    ${textInput}=    Get Value    ${regInputName}
    Should Be Equal    ${textInput}    ${randomName}

Validate Input Phone Field
    Element Should Be Visible     ${regInputPhone}
    Element Should Be Visible     ${helperInputPhone}
    Element Text Should Be        ${helperInputPhone}    ${labelFieldPhone}

Input Phone Number Field
    Generate Random Phone Number
    Input Text    ${regInputPhone}    ${randomPhone}
    ${textInput}=    Get Value    ${regInputPhone}
    Should Be Equal    ${textInput}    ${randomPhone}

Validate Input Business Name Field
    Element Should Be Visible     ${regInputPhone}
    Element Should Be Visible     ${helperInputPhone}
    Element Text Should Be        ${helperInputPhone}    ${labelFieldPhone}

Input Business Name Field
    Input Text    ${regInputBusinessName}    ${randomBusiness}
    ${textInput}=    Get Value    ${regInputBusinessName}
    Should Be Equal    +62${textInput}    ${randomName}

Validate Business Type Radio Button
# Validate Radio Business Type - Distributor
    Element Should Be Visible    ${radioTypeDistributor}
    Click Element    ${radioTypeDistributor}
    Element Should Be Visible    ${labelRadioDistributor}
    Element Text Should Be    ${labelRadioDistributor}    ${typeDistributor}
    Element Should Be Visible    ${helperRadioDistributor}
    Element Text Should Be    ${helperRadioDistributor}    ${radioDistributor}

# Validate Radio Business Type - Toko Retail
    Element Should Be Visible    ${radioTypeRetail}
    Click Element    ${radioTypeRetail}
    Element Should Be Visible    ${labelRadioRetail}
    Element Text Should Be    ${labelRadioRetail}    ${typeRetail}
    Element Should Be Visible    ${helperRadioRetail}
    Element Text Should Be    ${helperRadioRetail}    ${radioRetail}
    
# Validate Radio Business Type - Brand
    Element Should Be Visible    ${radioTypeBrand}
    Click Element    ${radioTypeBrand}
    Element Should Be Visible    ${labelRadioBrand}
    Element Text Should Be    ${labelRadioBrand}    ${typeBrand}
    Element Should Be Visible    ${helperRadioBrand}
    Element Text Should Be    ${helperRadioBrand}    ${radioBrand}

# Validate Radio Business Type - Toko Online
    Element Should Be Visible    ${radioTypeOnline}
    Click Element    ${radioTypeOnline}
    Element Should Be Visible    ${labelRadioOnline}
    Element Text Should Be    ${labelRadioOnline}    ${typeOnline}
    Element Should Be Visible    ${helperRadioOnline}
    Element Text Should Be    ${helperRadioOnline}    ${radioOnline}

Select Business Type
    ${typeList}=    Create List    ${radioTypeDistributor}    ${radioTypeRetail}    ${radioTypeBrand}    ${radioTypeOnline}
    ${array}=    Evaluate    random.randint(0, 3)    modules=random
    Click Element    ${typeList}[${array}]
    
    Run Keyword If    ${array} == 0
    ...    Log To Console    Selected Business Type : Distributor
    ...  ELSE IF    ${array} == 1
    ...    Log To Console    Selected Business Type : Toko Retail
    ...  ELSE IF    ${array} == 2
    ...    Log To Console    Selected Business Type : Brand
    ...  ELSE IF    ${array} == 3
    ...    Log To Console    Selected Business Type : Penjual Online
...      END


# Validate Input Email Field
#     Element Should Be Visible     ${helperInputEmail}
#     Element Text Should Be        ${helperInputEmail}    ${labelFieldEmail}

# Input Email Field
#     Element Should Be Visible    ${regInputName}
#     Input Text    ${regInputName}    ${randomName}
#     ${textInput}=    Get Value    ${regInputName}
#     Should Be Equal    ${textInput}    ${randomName}