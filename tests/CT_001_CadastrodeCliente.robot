*** Settings ***
Library    Browser



Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource
    

*** Test Cases ***
Novo Cadrastro
    [Tags]    cadastro
    Verificar homepage
    Take Screenshot    00_homepage
    Ir Para Login
    Take Screenshot   01_login
    Criar Nova Conta 
    Take Screenshot   07_cadastro_sucesso   