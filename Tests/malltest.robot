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
    ${pocet_radku}      get row count  Sheet1
    FOR  ${radek}  IN RANGE  2  ${pocet_radku+1}
       ${co_hledame}       read cell data by name  Sheet1  A${radek}
       ${co_kontrolujeme}  read cell data by name  Sheet1  B${radek}
       run keyword and continue on failure  Vyhledani znacky    ${co_hledame}
       run keyword and continue on failure  Kontrola vysledku   ${co_kontrolujeme}
       log  ${radek}
       go to  ${URL}
    END
    log  ${radek}