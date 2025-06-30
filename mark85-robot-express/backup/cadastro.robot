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

Não deve cadastrar um novo usuarioa com a senha curta    # teste de senha curta na mesma sessão do cadastro de usuáriom ou seja, não será aberto uma nova sessão do navegador para cada teste de senha curta, mas sim reutilizando a mesma sessão
    [Tags]    temp

    @{senha_curta}    Create List      1    12    123    1234    12345    # o @{senha_curta} é uma lista de senhas curtas, cada item da lista será usado em um teste diferente, já o Create list é uma keyword que cria uma lista de itens
    
    FOR    ${senhaCurta}    IN    @{senha_curta}
        ${usuario}    Create Dictionary    nome=matheus    email=matheus@gmail.com    senha=${senhaCurta}  #criando um dicionário com campos vazios, Empty é uma variável que representa um valor vazio

        Pagina de cadastro
        Submeter formulario de cadastro    ${usuario}

        alerta de campos obrigatórios      Informe uma senha com pelo menos 6 digito    
    END



Não dever cadastrar um novo usuarioa com a senha de 1 dígito
    [Tags]    senha_curta    
    [Template]    #template de testes, permite reutilizar o mesmo teste com diferentes dados
    Senha Curta    1            #Keyword que será executado com os dados fornecidos

Não dever cadastrar um novo usuarioa com a senha de 2 dígito
    [Tags]    senha_curta    
    [Template]    #template de testes, permite reutilizar o mesmo teste com diferentes dados
    Senha Curta    12            #Keyword que será executado com os dados fornecidos

Não dever cadastrar um novo usuarioa com a senha de 3 dígito
    [Tags]    senha_curta    
    [Template]    #template de testes, permite reutilizar o mesmo teste com diferentes dados
    Senha Curta    123            #Keyword que será executado com os dados fornecidos

Não dever cadastrar um novo usuarioa com a senha de 4 dígito
    [Tags]    senha_curta    
    [Template]    #template de testes, permite reutilizar o mesmo teste com diferentes dados
    Senha Curta    1234            #Keyword que será executado com os dados fornecidos

Não dever cadastrar um novo usuarioa com a senha de 5 dígito
    [Tags]    senha_curta    
    [Template]    #template de testes, permite reutilizar o mesmo teste com diferentes dados
    Senha Curta    12345            #Keyword que será executado com os dados fornecidos

*** Keywords ***    #template de testes, keywords são funções que podem ser reutilizadas em vários testes
Senha Curta
    [Arguments]    ${senhaCurta}

    ${usuario}    Create Dictionary    nome=matheus    email=matheus@gmail.com    senha=${senhaCurta}  #criando um dicionário com campos vazios, Empty é uma variável que representa um valor vazio

    Pagina de cadastro
    Submeter formulario de cadastro    ${usuario}

    alerta de campos obrigatórios      Informe uma senha com pelo menos 6 digitos





