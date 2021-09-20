*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Resource  ../Resources/MainPage.robot
Resource  ../Resources/ResultPage.robot

Test Setup  Start Mall Test
Test Teardown  close browser

*** Variables ***
${URL}  https://www.mall.cz/
${BROWSER}  chrome



*** Keywords ***
Start Mall Test
    open browser  ${URL}  ${BROWSER}
    maximize browser window


*** Test Cases ***
TC003 Mall search - Bosch
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    [Tags]  smoke  regrese
    Vyhledani znacky  Bosch
    Kontrola vysledku  Bosch



TC003 Mall search - Xiaomi
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    [Tags]  smoke
    Vyhledani znacky  Xiaomi
    Kontrola vysledku  Xiaomi


TC003 Mall search - Lenovo
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    [Tags]  design
    Vyhledani znacky  Lenovo
    Kontrola vysledku  Lenovo