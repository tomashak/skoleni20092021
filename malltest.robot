*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

Test Setup  open browser  https://www.mall.cz/  chrome
Test Teardown  close browser

*** Variables ***


*** Keywords ***


*** Test Cases ***
TC003 Mall search
    [Documentation]  Vyhledavani na hlavni strance, link na dokumentaci, autor, na co si dat pozor, konfigurace
    ...  dalsi radek dokumentace
    ...  a dalsi
    maximize browser window
    # sleep kvuli pomalejsimu nacitani
    sleep  2s
    wait until element is visible  //input[@id="site-search-input"]  timeout=10s
    input text  //input[@id="site-search-input"]  Bosch
    click element  //button[@id="search-button"]
    wait until element is visible  //h1//span[@data-sel="page-title"]
    element should contain  //h1//span[@data-sel="page-title"]  Bosch  V nadpisu neni hledana znacka