*** Settings ***

Documentation     Cenários de testes do cadastro de usuários
Resource    ../resources/base.resource
# Library    FakerLibrary

Test Setup       Start Session
Test Teardown    Take Screenshot


#*** Variables ***
#${nome}         MGama
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
    
Campos obrigatórios
    [Tags]    campos_obrigatorios

    ${usuario}    Create Dictionary    nome=${EMPTY}    email=${EMPTY}    senha=${EMPTY}  #criando um dicionário com campos vazios, Empty é uma variável que representa um valor vazio

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}

    alerta de campos obrigatórios    Informe seu nome completo
    alerta de campos obrigatórios    Informe seu e-email
    alerta de campos obrigatórios    Informe uma senha com pelo menos 6 digitos

    Sleep    4

Não dever cadastrar um usuário com email inválido
    [Tags]    email_invalido

    ${usuario}    Create Dictionary    nome=Xaviera    email=xavier123.com    senha=123456

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}    
    
    alerta de campos obrigatórios    Digite um e-mail válido



