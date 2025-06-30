*** Settings ***
Documentation     Cenários de tentativas cadastro com senhas curtas
Resource    ../resources/base.resource

Test Template        Senha Curta

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Não dever cadastrar um novo usuarioa com a senha de 1 dígito    1
Não dever cadastrar um novo usuarioa com a senha de 2 dígitos    12
Não dever cadastrar um novo usuarioa com a senha de 3 dígitos    123
Não dever cadastrar um novo usuarioa com a senha de 4 dígitos    1234
Não dever cadastrar um novo usuarioa com a senha de 5 dígitos   12345


*** Keywords ***    #template de testes, keywords são funções que podem ser reutilizadas em vários testes
Senha Curta
    [Arguments]    ${senhaCurta}

    ${usuario}    Create Dictionary    nome=matheus    email=matheus@gmail.com    senha=${senhaCurta}  #criando um dicionário com campos vazios, Empty é uma variável que representa um valor vazio

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}

    alerta de campos obrigatórios      Informe uma senha com pelo menos 6 digitos