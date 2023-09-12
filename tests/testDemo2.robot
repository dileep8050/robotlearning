*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Library    Collections
Test Setup    Open the browser with Mortage payment url
#Test Teardown    Close the browser session
Resource    Resources.robot
*** Variables ***
${Error_message_login}     css:.alert-danger
${Home_page_cartLink}       css:.nav-link

*** Test Cases ***
#validate login with invalid login credentials
#	Fill the Login form     ${username}     ${invalid_passwor}
#	wait until element is located in the page       ${Error_message_login}
#	Verify error message is correct


#validate cards display in the shopping page
#	Fill The Login Form     ${username}     ${valid_password}
#	wait until element is located in the page       ${Home_page_cartLink}
#	Verify the cart titles in the shop page
#	Select the card     Nokia Edge

Select the form and navigate to Child Window
	Fill the login details and login form

*** Keywords ***
Fill the Login form
	[Arguments]    ${username}      ${password}
	Input Text          id:username     ${username}
	Input Password      id:password     ${password}
	Click Button        signInBtn

wait until element is located in the page
	[Arguments]    ${element}
	Wait Until Element Is Visible    ${element}

Verify error message is correct
	${result}=  Get Text            ${Error_message_login}
	Should Be Equal As Strings      ${result}               Incorrect username/password.

Verify the cart titles in the shop page
	@{expectedList}=   Create List    iphone X	    Samsung Note 8		Nokia Edge		Blackberry
	${elements}=     Get Webelements    css:.card-title
	@{actualList}=      Create List
	FOR    ${element}   IN      @{elements}
		Append To List    ${actualList}     ${element.text}
		Log    ${element.text}
	END
	Lists Should Be Equal    ${expectedList}        ${actualList}

Select the card
	[Arguments]    ${cardName}
	${elements}=     Get Webelements    css:.card-title
	${index} =   Set Variable    1
	FOR    ${element}   IN      @{elements}
		Exit For Loop If    '${cardName}' == '${element.text}'
		${index} =  Evaluate     ${index} +1
	END
	Click Button    xpath:(//*[@class='card-footer'])[${index}]/button
	Sleep    10s

Fill the login details and login form
	Input Text          id:username     rahulshettyacademy
	Input Password      id:password     learning
	Click Element       xpath://input[@value='user']
	Wait Until Element Is Visible    css:.modal-content
	Click Element       id:okayBtn
	Click Element       id:okayBtn
	Wait Until Element Is Not Visible    css:.modal-content
	Select From List By Value    css:select.form-control    teach
	Select Checkbox    id:terms
	Checkbox Should Be Selected    id:terms
	Sleep    5s