*** Settings ***
Documentation     Elementos e ações da página de cadastro

Library      Browser
Resource     ../env.resource


*** Keywords ***

Pagina de cadastro

    Go To    ${BASE_URL}/signup

    # check points - pontos de verificação se estou passando pelo fluxo correto
    Wait For Elements State        css=h1            visible    5                    #espera até 5 segundos para o elemento estar visível
    Get Text                       css=h1            equal      Faça seu cadastro    # verifica se o texto é igual ao esperado

Submeter formulario de cadastro
    [Arguments]    ${usuario}

    Fill Text    id=name           ${usuario}[nome]
    Fill Text    css=#email        ${usuario}[email]
    Fill Text    css=#password     ${usuario}[senha]
    
    Click        id=buttonSignup

Mensagem de boas vindas
    [Arguments]    ${texto_esperado}
    
    ${elemento}    Set Variable    css=.notice p

    Wait For Elements State    ${elemento}    visible    5
    Get Text                   ${elemento}    equal      ${texto_esperado}

    