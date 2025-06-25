*** Settings ***
Documentation     Online
Library           Browser

*** Test Cases ***
Aplicação Online
    
    New Browser       browser=chromium     headless=false 
    New Page    localhost:3000
    Get Title    equal    Mark85 by QAx
    Sleep    10