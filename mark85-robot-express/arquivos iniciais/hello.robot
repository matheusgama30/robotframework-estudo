*** Settings ***
Documentation    Exemplo em robot framework
Library    lib.py   # Importa a biblioteca Python

*** Test Cases ***
Deve mostrar mensagem de boas vindas
    Log      Hello Robot Framework  # Loga a mensagem no console
    meuLog   Olá Robot Framework  # Chama a função da biblioteca Python
