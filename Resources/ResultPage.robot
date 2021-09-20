*** Variables ***
${XPATH_RESULT_H1}  //h1//span[@data-sel="page-title"]

*** Keywords ***
Kontrola vysledku
    [Arguments]  ${znacka}
    wait until element is visible  ${XPATH_RESULT_H1}
    ${co_realne_je_v_nadpisu}  get text  ${XPATH_RESULT_H1}
    element should contain  ${XPATH_RESULT_H1}  ${znacka}  V nadpisu neni hledana znacka, hledali jsme ${znacka}, ale bylo ${co_realne_je_v_nadpisu}

