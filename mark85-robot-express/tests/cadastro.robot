*** Settings ***

Documentation     Cenários de testes do cadastro de usuários
Resource    ../resources/base.resource
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

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}
    Mensagem de boas vindas    Boas vindas ao Mark85, o seu gerenciador de tarefas.



Não deve permitir cadastrar um usuário com email já existente
    [Tags]    dup     # tag para identificar o teste de duplicação, pode ser usado para filtrar testes

    ${usuario}       Create Dictionary
    ...    nome=Gama    
    ...    email=matheusgama123@gmail.com    
    ...    senha=123456

    Remover usuário do banco de dados   ${usuario}[email]
    Inserir usuário no banco de dados   ${usuario}

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}
    Mensagem de boas vindas    Oops! Já existe uma conta com o e-mail informado.
    
