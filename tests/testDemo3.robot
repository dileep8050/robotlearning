*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Library    String
Test Setup    Open the browser with Mortage payment url
Test Teardown    Close the browser session
Resource    Resources.robot
*** Variables ***
${Error_message_login}     css:.alert-danger
${Home_page_cartLink}       css:.nav-link
${email}

*** Test Cases ***
Validate child window functionality
	Select the link of Child window
	Verify the user is switched to Child window
	Grab the emil id in the child window
	Swith to parent window and enter the Email

*** Keywords ***
Select the link of Child window
	Click Element    css:.blinkingText
	Sleep    10s

Verify the user is switched to Child window
	Switch Window   NEW
	Element Text Should Be    css:h1    DOCUMENTS REQUEST

Grab the emil id in the child window
	${text}=    Get Text    css:.red
	@{words}=   Split String    ${text}     at
	${text_split} =    Get From List    ${words}    1
    log     ${text_split}
    @{words_1}=   Split String    ${text_split}
    ${email} =    Get From List    ${words_1}      0
    Log    ${email}
    Set Global Variable     ${email}

Swith to parent window and enter the Email
	Switch Window    MAIN
	Title Should Be    LoginPage Practise | Rahul Shetty Academy
	Log    ${email}
	Input Text      id:username     ${email}