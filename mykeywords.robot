*** Settings ***

Library       SeleniumLibrary

*** Variables ***

${BROWSER}              firefox
${LOGIN URL}            https://poczta.wp.pl
${LOGIN}                //*[@id="login"]
${ACCOUNT PASSWORD}     //*[@id="password"]
${ZALOGUJ BUTTON}       //*[@id="btnSubmit"]
${LOGOUT}               //*[@id="Logout-Button"]
${WPLOGIN}              testerwsb_t1
${WPPASSWORD}           adam1234
${WPERRPASSWORD}        adam123
${WPERRLOGIN}						testerwsb_t4


*** Keywords ***
${page} setup
	Open Browser     ${LOGIN URL}			${BROWSER}

${page} teardown
	Close All browsers

credentials
	[Return]  ${WPLOGIN}      ${WPPASSWORD}

bad credentials
	[Return]   aaa    bbbb

logged
	[Return]  Odebrane


Enter Credentials
	[Arguments]  ${user}   ${pass}
	Input Text   ${LOGIN}   ${user}
	Input Text   ${ACCOUNT PASSWORD}  ${pass}
	Click Button   ${ZALOGUJ BUTTON}
	Sleep  15

webpage check
	[Arguments]  ${slowo}
	${result}=   Run Keyword And Return Status   Page Should Contain   ${slowo}
	${result}=   set variable if   ${result}			OK		NOTOK
	[Return]   ${result}
