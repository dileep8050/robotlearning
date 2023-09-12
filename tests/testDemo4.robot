*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template   validate successful login

*** Variables ***
${Error_message_login}     css:.alert-danger

*** Test Cases ***      username                password
Invalid username        asdlfj                  learning
Invalid password        rahulshettyacademy      asdfalsd
Special characters      $#%@#$                  learning



*** Keywords ***
validate successful login
	[Arguments]    ${username}      ${password}
	Open the browser with Mortage payment url
	Fill the Login form     ${username}     ${password}
	Wait until it checks and display error message
	Verify error message is correct


Open the browser with Mortage payment url
	Create Webdriver    Chrome      executable_path=resources/chromedriver.exe
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the Login form
	[Arguments]    ${username}      ${password}
	Input Text          id:username   ${username}
	Input Password      id:password   ${password}
	Click Button        signInBtn

Wait until it checks and display error message
	Wait Until Element Is Visible    ${Error_message_login}
Verify error message is correct
	${result}=  Get Text            ${Error_message_login}
	Should Be Equal As Strings      ${result}               Incorrect username/password.

