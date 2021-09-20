*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary
Library  ExcelRobot
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
    [Tags]  smoke  regrese  debug
    open excel  Data/TestData.xls
    ${co_hledame}       read cell data by name  Sheet1  A2
    ${co_kontrolujeme}  read cell data by name  Sheet1  B2
    Vyhledani znacky    ${co_hledame}
    Kontrola vysledku   ${co_kontrolujeme}



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