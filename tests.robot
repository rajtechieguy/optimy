*** Settings ***
Library           SeleniumLibrary
Test Setup    Open Browser    ${URL}    ${BROWSER}
Test Teardown    Close Browser

*** Variables ***
${URL}    https://automationinterface1.front.staging.optimy.net/en/
${BROWSER}    Chrome
${USERNAME}    optimyautomationtester@gmail.com
${PASSWORD}    yRMhojb7
${WEBDRIVER PATH}   C:\chromedriver\chromedriver.exe
${first_name}    John
${last_name}    Wick
${addr}    9024 Thrasher Avenue, Los Angeles
${postalcode}    1000
${country}    US
${filepath}    C:\\Users\\gpavadax\\Downloads\\sample.png
${filename}    sample.png
@{skills}    Spreadsheet    JIRA    Test management tool (any)    Python    Robot Framework
${role}    Automation tester
${objective}    This is a sample text goes inside iframe.

*** Test Cases ***
Submit New Application with Valid Data and Verify Confirmation.
    Given User opens the login page
    When User enters credentials
    And User clicks the login button
    And User should be logged in
    And Click Submit a new application button
    And fill the form fields
    Then Verify all the inputted values are displayed in the Summary screen
    And Click Validate and send button
    And Verify you are redirected to "Thank you for submitting your project" page

*** Keywords ***
User opens the login page
    Set Browser Implicit Wait    10s
    Maximize Browser Window
    Wait Until Element Is Visible    css:button#cookie-close-button
    Click Element    css:button#cookie-close-button
    Click Element    css:a[href='/en/user/login/']


User enters credentials
    Input Text    css:input[id='login-email']    ${USERNAME} 
    Input Password    css:input[id='login-password']    ${PASSWORD}

User clicks the login button
    Click Element    css:button.btn.btn-lg.btn-primary[type="submit"]

User should be logged in
    Page Should not Contain    Login
Click Submit a new application button
    Click Element    css:a[href='project/new/']
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight);
    Wait Until Element Is Visible    xpath://*[@id="content"]/div/div/div/div/section/div/a
    Click Element    xpath://*[@id="content"]/div/div/div/div/section/div/a

fill the form fields
    Wait Until Page Contains Element    css:input[aria-label="First name"] 
    Input Text    css:input[aria-label="First name"]    ${first_name}
    Input Text    css:input[aria-label="Last name"]    ${last_name}
    Input Text    css:textarea[aria-label="Unit no/House no, Street"]    ${addr}
    Input Text    css:input[aria-label="Select postal code"]    ${postalcode}
    Wait Until Element Is Visible    css:.ui-autocomplete .ui-menu-item a
    Click Element    css:.ui-autocomplete .ui-menu-item a
    Select From List By Value    css:select[aria-label="Country"]    ${country}
    Choose File    css:input[name="Filedata"]    ${filepath}
    Click Element    css:label[aria-label="Male"]
    Select From List by Label    css:select[id='field_f801d7d8-0762-5407-95f9-b8c3a793157c']    ${role}
    FOR    ${label}    IN    @{skills}
        Click Element    css:label[aria-label='${label}']
    END
    Select Frame    class:cke_wysiwyg_frame
    Input Text    css:body[role="textbox"]   ${objective}
    Unselect Frame
    Click Element    css:button[id='navButtonNext']
Verify all the inputted values are displayed in the Summary screen
    Page Should Contain    ${first_name}
    Page Should Contain    ${last_name}
    Page Should Contain    ${addr} 
    Page Should Contain    ${postalcode}
    Page Should Contain    ${country}
    Page Should Contain    ${filename}
    Page Should Contain    ${role}
    FOR    ${label}    IN    @{skills}
        Page Should Contain    ${label}
    END
    Page Should Contain    ${objective}

Click Validate and send button
    Wait Until Page Contains Element    css:#submitButton
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Execute JavaScript  document.querySelector('#submitButton').click()

Verify you are redirected to "${thankyou_page}" page
    Page Should Contain    ${thankyou_page}