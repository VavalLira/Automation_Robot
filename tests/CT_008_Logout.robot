*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***

Realizar Logout com Sucesso
    [Tags]    logout    login    
    Verificar homepage
    Take Screenshot   01_homepage
    Ir Para Login
    Take Screenshot   02_pagina_login
    Preencher Login    ${email}    ${senha}
    Take Screenshot   03_login_preenchido
    Submeter Login
    Validar Login Sucesso
    Take Screenshot   04_login_sucesso
    Realizar Logout
    Take Screenshot   05_logout_clicado
    Validar Logout Sucesso
    Take Screenshot   06_logout_sucesso