*** Settings ***

Documentation     Cenários de testes do cadastro de usuários
Resource    ../resources/base.robot
# Library    FakerLibrary

Test Setup       Start Session
Test Teardown    Take Screenshot


#*** Variables ***
#${nome}          MGama
#${email}        matheusgama123@gmail.com
#${senha}        123456

*** Test Cases ***

Deve poder cadastrar um usuário com sucesso
    
    ${usuario}       Create Dictionary
    ...    nome=MGama    
    ...    email=MGama@gmail.com    
    ...    senha=123456
    

    Remover usuário do banco de dados    ${usuario}[email]


    Go To    url=http://localhost:3000/signup

    # check points - pontos de verificação se estou passando pelo fluxo correto
    Wait For Elements State        css=h1            visible    5                    #espera até 5 segundos para o elemento estar visível
    Get Text                       css=h1            equal      Faça seu cadastro    # verifica se o texto é igual ao esperado

    Fill Text    id=name           ${usuario}[nome]
    Fill Text    css=#email        ${usuario}[email]
    Fill Text    css=#password     ${usuario}[senha]
    
    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir cadastrar um usuário com email já existente
    [Tags]    dup     # tag para identificar o teste de duplicação, pode ser usado para filtrar testes

    ${usuario}       Create Dictionary
    ...    nome=Gama    
    ...    email=matheusgama123@gmail.com    
    ...    senha=123456

    Remover usuário do banco de dados   ${usuario}[email]
    Inserir usuário no banco de dados   ${usuario}

    Go To    url=http://localhost:3000/signup

    # check points - pontos de verificação se estou passando pelo fluxo correto
    Wait For Elements State        css=h1            visible    5                    #espera até 5 segundos para o elemento estar visível
    Get Text                       css=h1            equal      Faça seu cadastro    # verifica se o texto é igual ao esperado
    
    Fill Text    id=name           ${usuario}[nome]
    Fill Text    css=#email        ${usuario}[email]
    Fill Text    css=#password     ${usuario}[senha]

    Click        id=buttonSignup

    Wait For Elements State    css=.notice p    visible    5
    Get Text                   css=.notice p    equal      Oops! Já existe uma conta com o e-mail informado.
