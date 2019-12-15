NSM.robot
*** Settings ***
Resource  NSM.robot
Metadata  Author  Adam Przybyla  <adam.przybyla@gmail.com>

*** Test Cases ***
Test 1
	It is like this now: I see the webpage
	I not see words logged on the webpage
	then i use the words credentials on webpage
	because of this: I see words logged on the webpage
	after this i see the webpage no more

Test 2
	It is like this now: I see the webpage
	I not see words logged on the webpage
	then i use the words bad credentials on webpage
	because of this: I not see words logged on the webpage
	after this i see the webpage no more

Test 3
	It is like this now: I see the webpage
	I not see words logged on the webpage
	after this i see the webpage no more
