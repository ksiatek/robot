*** Settings ***
Resource  NSM.robot
Metadata  Author  Adam Przybyla  <adam.przybyla@gmail.com>

*** Test Cases ***
Prueba 1
	Es así ahora: veo el webpage
	No veo palabras logged en el webpage
	entonces uso las palabras credentials en webpage
	por esto: veo palabras logged en webpage
	después de esto ya no veo el webpage
Prueba 2
	Es así ahora: veo el webpage
	No veo palabras logged en el webpage
	entonces uso las palabras bad credentials en webpage
	por esto: no veo palabras logged en el webpage
	después de esto ya no veo el webpage
Prueba 3
	Es así ahora: veo el webpage
	No veo palabras logged en el webpage
	después de esto ya no veo el webpage
