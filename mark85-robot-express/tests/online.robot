*** Settings ***
Documentation     Online
Resource    ../resources/base.resource

*** Test Cases ***
Aplicação Online

    Start Session
    
    Get Title    equal    Mark85 by QAx
    Sleep    3