*** Settings ***
Documentation    A resource file wtih reusable keywords and variables
...              This is second line
Library    SeleniumLibrary
*** Variables ***
${username}             rahulshettyacademy
${invalid_passwor}      1234567
${valid_password}       learning
${url}      https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with Mortage payment url
	Create Webdriver    Chrome
    Go To    ${url}

Close the browser session
	Close Browser