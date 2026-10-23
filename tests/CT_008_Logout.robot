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
    Fazer Login    ${email}    ${senha}
    Take Screenshot   04_login_sucesso
    Realizar Logout
    Take Screenshot   05_logout_clicado
    Validar Logout Sucesso
    Take Screenshot   06_logout_sucesso