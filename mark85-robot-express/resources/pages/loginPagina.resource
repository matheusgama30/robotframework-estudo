*** Settings ***
Documentation    Açoes e elementos da página de login
Library    Browser

*** Keywords ***
submeter página de login
    [Arguments]    ${usuario}

    Fill Text    css=input[placeholder$=mail]    ${usuario}[email]
    Fill Text    css=input[placeholder=Senha]    ${usuario}[senha]

    Click        id=buttonLogin

Verificar mensagem de boas vindas
    [Arguments]    ${mensagem}
    