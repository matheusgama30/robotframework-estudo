*** Settings ***

Documentation     Cenários de testes do cadastro de usuários
Library    Browser
Library    FakerLibrary

*** Test Cases ***

Deve poder cadastrar um usuário com sucesso
    ${nome}           FakerLibrary.Name
    ${email}          FakerLibrary.Free Email
    ${senha}          Set Variable    123456

    New Browser       browser=chromium                 headless=false
    New Page          http:localhost:3000/signup

    # check points - pontos de verificação se estou passando pelo fluxo correto
    Wait For Elements State        css=h1            visible    5                    #espera até 5 segundos para o elemento estar visível
    Get Text                       css=h1            equal      Faça seu cadastro    # verifica se o texto é igual ao esperado

    Fill Text    id=name           ${nome}
    Fill Text    css=#email        ${email}
    Fill Text    css=#password     ${senha}
    
    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.
