*** Settings ***

Documentation     Cenários de testes do cadastro de usuários
Library    Browser

*** Test Cases ***

Deve poder cadastrar um usuário com sucesso
    New Browser       browser=chromium                 headless=false
    New Page          http:localhost:3000/signup

    # check points - pontos de verificação se estou passando pelo fluxo correto
    Wait For Elements State        css=h1            visible    5                    #espera até 5 segundos para o elemento estar visível
    Get Text                       css=h1            equal      Faça seu cadastro    # verifica se o texto é igual ao esperado
    Sleep    5