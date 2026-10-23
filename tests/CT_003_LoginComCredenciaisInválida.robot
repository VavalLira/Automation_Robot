*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource

*** Test Cases ***

Login Inválido
    [Tags]    login   negative 
    Verificar homepage
    Ir Para Login
    Preencher Login    ${EMAIL_TESTE_INVALIDO}    ${SENHA_TESTE_INVALIDO}
    Submeter Login
    Validar Login Invalido
    Take Screenshot   02_login_Invalido
    