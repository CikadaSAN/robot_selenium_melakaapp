*** Settings ***
Library      SeleniumLibrary
Library      String
Library      BuiltIn

Variables    ../../RESOURCES/LOCATOR/xpathRegisterPage.py
Variables    ../../RESOURCES/LOCATOR/wordingRegisterPage.py
Resource     ../../RESOURCES/VARIABLES/testingVariables.robot
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
    Page Should Contain Element    ${checkboxTerms}
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

Input Name Field Invalid
    Input Text    ${regInputName}    tst
    Click Element    ${regInputPhone}
    Wait Until Element Is Visible    ${helperInputName}
    ${wordingError}=    Get Text    ${helperInputName}
    Should Be Equal    ${wordingError}    ${errorInputName}

Validate Input Phone Field
    Element Should Be Visible     ${regInputPhone}
    Element Should Be Visible     ${helperInputPhone}
    Element Text Should Be        ${helperInputPhone}    ${labelFieldPhone}

Input Phone Number Field
    Generate Random Phone Number
    Input Text    ${regInputPhone}    ${randomPhone}
    ${textInput}=    Get Value    ${regInputPhone}
    Should Be Equal    ${textInput}    ${randomPhone}

Input Phone Number Field Invalid
    Input Text    ${regInputPhone}    8123
    Click Element    ${regInputName}
    Wait Until Element Is Visible    ${helperInputPhone}
    ${helperError}    Get Element Attribute    ${helperInputPhone}    class
    Should Contain    ${helperError}    text-red-R700

Validate Input Business Name Field
    Element Should Be Visible     ${regInputPhone}
    Element Should Be Visible     ${helperInputPhone}
    Element Text Should Be        ${helperInputPhone}    ${labelFieldPhone}

Input Business Name Field
    Input Text    ${regInputBusinessName}    ${randomBusiness}
    ${textInput}=    Get Value    ${regInputBusinessName}
    Should Be Equal    ${textInput}    ${randomBusiness}

Input Business Name Field Invalid
    Input Text    ${regInputBusinessName}    tst
    Click Element    ${regInputPhone}
    Wait Until Element Is Visible    ${helperInputBusiness}
    ${wordingError}=    Get Text    ${helperInputBusiness}
    Should Be Equal    ${wordingError}    ${errorInputBusiness}

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

Validate Input Email Field
    Element Should Be Visible     ${regInputEmail}
    Element Should Be Visible     ${helperInputEmail}
    Element Text Should Be        ${helperInputEmail}    ${labelFieldEmail}

Input Email Field
    Element Should Be Visible    ${regInputEmail}
    Input Text    ${regInputEmail}    ${randomEmail}
    ${textInput}=    Get Value    ${regInputEmail}
    Should Be Equal    ${textInput}    ${randomEmail}

Input Email Field Invalid
    Input Text    ${regInputEmail}    tst
    Click Element    ${regInputBusinessName}
    Wait Until Element Is Visible    ${helperInputEmail}
    ${wordingError}=    Get Text    ${helperInputEmail}
    Should Be Equal    ${wordingError}    ${errorInputEmail}

Validate Input Password Field
    Scroll Element Into View     ${buttonLogin}
    Element Should Be Visible    ${regInputPass}
    Element Should Be Visible    ${showPassBtn}
    Element Should Be Visible    ${helperInputPass}
    Element Text Should Be       ${helperInputPass}    ${labelFieldPass}

Input Password Field
    Element Should Be Visible    ${regInputPass}
    Input Text    ${regInputPass}    ${validPwd}
    Click Button    ${showPassBtn}
    ${textInput}=    Get Value    ${regInputPass}
    Should Be Equal    ${textInput}    ${validPwd}
    Wait Until Element Is Visible    ${showPassBtn}
    Click Button    ${showPassBtn}

Input Password Field Invalid
    Scroll Element Into View    ${buttonLogin}
    Input Text    ${regInputPass}    8123
    Click Element    ${regInputConfirmPass}
    Wait Until Element Is Visible    ${helperInputPass}
    ${helperError}    Get Element Attribute    ${helperInputPass}    class
    Should Contain    ${helperError}    text-red-R700

Validate Input Confirm Password Field
    Element Should Be Visible    ${regInputConfirmPass}
    Element Should Be Visible    ${showConfirmPassBtn}

Input Confirm Password Field
    Element Should Be Visible    ${regInputConfirmPass}
    Input Text    ${regInputConfirmPass}    ${validConfirmPwd}
    Click Button    ${showConfirmPassBtn}
    ${textInput}=    Get Value    ${regInputConfirmPass}
    Should Be Equal    ${textInput}    ${validConfirmPwd}
    Wait Until Element Is Visible    ${showConfirmPassBtn}
    Click Button    ${showConfirmPassBtn}

Input Confirm Password Field Invalid
    Input Text    ${regInputConfirmPass}    test
    Click Element    ${regInputPass}
    Wait Until Element Is Visible    ${helperInputConfirmPass}
    ${wordingError}=    Get Text    ${helperInputConfirmPass}
    Should Be Equal    ${wordingError}    ${errorInputConfirmPass}

Validate Checkbox Accept Terms & Conditions
    Element Should Be Visible    ${checkboxTerms}
    Element Should Be Visible    ${descriptionTerms}
    Element Should Be Visible    ${urlTermsKetentuan}
    Element Should Be Visible    ${urlTermsEtik}
    Element Should Be Visible    ${urlTermsPrivasi}
    Element Should Be Visible    ${urlTermsPembatalan}
    ${tabTitle}=    Get Title
    Set Global Variable    ${tabTitle}
    Log To Console    Tab Name : ${tabTitle}
  
Check Checkbox Accept Terms & Conditions
    Wait Until Element Is Visible    ${checkboxTerms}
    Click Element    ${checkboxTerms}
    Checkbox Should Be Selected    ${checkboxTerms}

Check URL Ketentuan Penggunaan
    Wait Until Element Is Visible    ${urlTermsKetentuan}
    Click Element    ${urlTermsKetentuan}
    Sleep    1s
    Switch Window    title=${tabTitleTermsKetentuan}
    Wait Until Page Contains    ${titleTermsKetentuan}    30
    Close Window
    Switch Window    title=${tabTitle}
    Wait Until Element Is Visible    ${urlTermsKetentuan}

Check URL Kode Etik Penjual 
    Wait Until Element Is Visible    ${urlTermsEtik}
    Click Element    ${urlTermsEtik}
    Sleep    1s
    Switch Window    title=${tabTitleTermsEtik}
    Wait Until Page Contains    ${titleTermsEtik}    30
    Close Window
    Switch Window    title=${tabTitle}
    Wait Until Element Is Visible    ${urlTermsEtik}

Check URL Kebijakan Privasi
    Wait Until Element Is Visible    ${urlTermsPrivasi}
    Click Element    ${urlTermsPrivasi}
    Sleep    1s
    Switch Window    title=${tabTitleTermsPrivasi}
    Wait Until Page Contains    ${titleTermsPrivasi}    30
    Close Window
    Switch Window    title=${tabTitle}
    Wait Until Element Is Visible    ${urlTermsPrivasi}

Check URL Ketentuan Pembatalan dan Pengembalian
    Wait Until Element Is Visible    ${urlTermsPembatalan}
    Click Element    ${urlTermsPembatalan}
    Sleep    1s
    Switch Window    title=${tabTitleTermsPembatalan}
    Wait Until Page Contains    ${titleTermsPembatalan}    30
    Close Window
    Switch Window    title=${tabTitle}
    Wait Until Element Is Visible    ${urlTermsPembatalan}

Submit Button Register
    Wait Until Element Is Visible    ${buttonSubmit}
    Element Should Be Enabled    ${buttonSubmit}
    Click Element    ${buttonSubmit}

Check Button Login
    Scroll Element Into View    ${buttonLogin}
    Wait Until Element Is Visible    ${buttonLogin}
    Click Element    ${buttonLogin}
    Wait Until Element Is Visible    ${buttonSubmit}    30
    Go Back
    Wait Until Element Is Visible    ${buttonLogin}    30
    Execute JavaScript    window.scrollTo(0, 0)