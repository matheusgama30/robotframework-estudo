*** Settings ***
Documentation     cenarios de autencicação do usuário
Resource           ../resources/base.resource

Test Setup        Start Session
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder logar com um usuario pré cadastrado
    ${usuario}    Create Dictionary    nome=matheus gama    email=matheus12345@gmail.com    senha=123456


    submeter página de login    ${usuario}

    Remover usuário do banco de dados   ${usuario}[email]
    Inserir usuário no banco de dados   ${usuario}



    Sleep    4