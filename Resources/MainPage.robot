*** Variables ***
${XPATH_SEARCH_BTN}  //button[@id="search-button"]
${XPATH_SEARCH_INPUT}  //input[@id="site-search-input"]

*** Keywords ***
Vyhledani znacky
    [Arguments]  ${znacka}  ${nepovinny}=nejaky text
    sleep  2s
    wait until element is visible  ${XPATH_SEARCH_INPUT}  timeout=10s
    input text  ${XPATH_SEARCH_INPUT}  ${znacka}
    click element  ${XPATH_SEARCH_BTN}
    log  ${nepovinny}
