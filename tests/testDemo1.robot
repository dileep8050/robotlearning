*** Settings ***
Documentation    To validate the login form
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${Error_message_login}     css:.alert-danger

*** Test Cases ***
validate successful login
	Open the browser with Mortage payment url
	Fill the Login form
	Wait until it checks and display error message
	Verify error message is correct

*** Keywords ***
Open the browser with Mortage payment url
	Create Webdriver    Chrome      executable_path=resources/chromedriver.exe
    Go To    https://rahulshettyacademy.com/loginpagePractise/
Fill the Login form
	Input Text          id:username   rahulshettyacademy
	Input Password      id:password   1234566
	Click Button        signInBtn

Wait until it checks and display error message
	Wait Until Element Is Visible    ${Error_message_login}
Verify error message is correct
	${result}=  Get Text            ${Error_message_login}
	Should Be Equal As Strings      ${result}               Incorrect username/password.

