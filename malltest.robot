*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

Test Setup  open browser  ${URL}  ${BROWSER}
Test Teardown  close browser

*** Variables ***
${URL}  https://www.mall.cz/
${BROWSER}  chrome
${XPATH_SEARCH_BTN}  //button[@id="search-button"]
${XPATH_SEARCH_INPUT}  //input[@id="site-search-input"]
${XPATH_RESULT_H1}  //h1//span[@data-sel="page-title"]

*** Keywords ***
Vyhledani znacky
    [Arguments]  ${znacka}  ${nepovinny}=nejaky text
    sleep  2s
    wait until element is visible  ${XPATH_SEARCH_INPUT}  timeout=10s
    input text  ${XPATH_SEARCH_INPUT}  ${znacka}
    click element  ${XPATH_SEARCH_BTN}
    log  ${nepovinny}

Kontrola vysledku
    [Arguments]  ${znacka}
    wait until element is visible  ${XPATH_RESULT_H1}
    element should contain  ${XPATH_RESULT_H1}  ${znacka}  V nadpisu neni hledana znacka


*** Test Cases ***
TC003 Mall search - Bosch
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    maximize browser window
    Vyhledani znacky  Bosch
    Kontrola vysledku  Bosch



TC003 Mall search - Xiaomi
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    maximize browser window
    Vyhledani znacky  Xiaomi
    Kontrola vysledku  Xiaomi


TC003 Mall search - Lenovo
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    maximize browser window
    Vyhledani znacky  Lenovo
    Kontrola vysledku  Lenovo