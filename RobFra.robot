*** Settings ***
Library       SSHLibrary
Library       mylibrary.py
Library       Impansible
Library       Collections
Library       SeleniumLibrary

***Variables ***
${POWITANIE}            Hello, world!
${HOST}                 localhost
${USERNAME}             tester
${PASSWORD}             tester

${BROWSER}              firefox
${LOGIN URL}            https://poczta.wp.pl
${LOGIN}                //*[@id="login"]
${ACCOUNT PASSWORD}     //*[@id="password"]
${ZALOGUJ BUTTON}       //*[@id="btnSubmit"]
${LOGOUT}               //*[@id="Logout-Button"]
${WPLOGIN}              testerwsb_t1
${WPPASSWORD}           adam1234
${WPERRPASSWORD}        adam123




***Test Cases ***
User Registration Test
  Log To Console   Example Test

Logging-in Test
  Log To Console   ${POWITANIE}

Updating Client Profile Test
  Show Text   POWITANIE   POZEGNANIE

Logging-out Test
  Show Text2   POZEGNANIE

Logowanie do zdalnej maszyny

  otwarcie polaczenia do komuputera
  wprowadzenie uzytkownika i hasla
  sprawdzenie czy nastapilo zalogowanie
  zamkniecie polaczenia do komputera


  Open Connection     ${HOST}
  Login     ${USERNAME}       ${PASSWORD}
  ${rc}=   Execute Command      uname -a
  Should Contain    ${rc}     UTC
  Close Connection

Compare Two Strings
  ${result}=  join two strings   Hello     world
  Should Be Equal  ${result}   Hello world


# Logowanie do zdalnej maszyny wrong credentials

  # otwarcie polaczenia do komuputera
  # wprowadzenie blednego uzytkownika i hasla
  # sprawdzenie czy nastapilo zalogowanie
  # zamkniecie polaczenia do komputera

  # Open Connection     ${HOST}
  # Login     ${USERNAME}       ${PASSWORD}
  # ${rc}=   Execute Command      uname -a
  # Should Be Equal    ${rc}     UTC
  # Close Connection

Kolejny przypadek Testowy
  Join Two Random Strings

Przypadek Testowy z wykorzystaniem bibliotek Ansible
  ${result}=    Setup
  ${facts}=  Get From Dictionary  ${result}   ansible_facts
  ${hostname}=  Get From Dictionary  ${facts}   ansible_hostname
  ${distribution}=    Get From Dictionary  ${facts}   ansible_distribution
  Should Contain   ${distribution}    Ubuntu
  Should Contain    ${hostname}   tester-m

Logowanie na poczte Wirtualnej Polski
  Wejdz na strone poczty Wirtualnej Polski
  Wprowadz nazwe uzytkownika
  Wprowadz haslo
  Kliknij Zaloguj sie
  Sprawdz nowa poczte
  Wyloguj sie
  Zamknij przegladarke

Bledne logowanie na poczte Wirtualnej Polski
  Wejdz na strone poczty Wirtualnej Polski
  Wprowadz nazwe uzytkownika
  Wprowadz bledne haslo
  Kliknij Zaloguj sie
  Sprawdz ze nie zostales zalogowany
  Zamknij przegladarke


*** Keywords ***
Show Text
  [Arguments]   ${wiadomosc}    ${cokolwiek}
  Log To Console   ${wiadomosc}
  Log To Console   ${cokolwiek}

Show Text2
  [Arguments]   ${pokaz tekst}
  Log To Console    ${pokaz tekst}

otwarcie polaczenia do komuputera
  Open Connection     ${HOST}

wprowadzenie uzytkownika i hasla
  Login     ${USERNAME}       ${PASSWORD}

sprawdzenie czy nastapilo zalogowanie
  ${rc}=   Execute Command      uname -a
  Should Contain    ${rc}     UTC

zamkniecie polaczenia do komputera
  Close Connection

Join Two Random Strings
  ${helloKas}=  join_two_strings   Happy   times
  Should Be Equal  ${helloKas}     Happy times

Wejdz na strone poczty Wirtualnej Polski
  Open Browser     ${LOGIN URL}

Wprowadz nazwe uzytkownika
  Input Text   ${LOGIN}   ${WPLOGIN}

Wprowadz haslo
  Input Text   ${ACCOUNT PASSWORD}    ${WPPASSWORD}

Kliknij Zaloguj sie
  Click Button   ${ZALOGUJ BUTTON}

Sprawdz nowa poczte
  Sleep     5
  Page Should Contain   Odebrane

Wyloguj sie
  Click Button    ${LOGOUT}

Zamknij przegladarke
  Close All browsers

Wprowadz bledne haslo
  Input Text   ${ACCOUNT PASSWORD}    ${WPERRPASSWORD}


Sprawdz ze nie zostales zalogowany
  Page Should Not Contain     Odebrane
