*** Settings ***
Library      libs/database.py
Library      Browser

Resource     env.resource  #importando o arquivo de variáveis globais
Resource     pages/CadastroPagina.resource
Resource     pages/loginPagina.resource

*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=false
    New Page       ${BASE_URL}
     