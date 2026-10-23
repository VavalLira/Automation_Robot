*** Settings ***
Library    Browser



Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource
    

*** Test Cases ***

Cadastro com Email Existente
    [Tags]    cadastro    negative
    
    Verificar homepage
    Ir Para Login
    take Screenshot    01_pagina_login
    Tentar criar conta com email já cadastrado
    Take Screenshot    02_cadastro_email_existente
    Validar mensagem de erro
    Take Screenshot    03_email_existente