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
    Criar Conta
    Take Screenshot   02_cadastro
    Preencher Dados da Conta
    Take Screenshot   04_dados_conta
    Preencher Endereco
    Take Screenshot   05_endereco
    Submeter Cadastro
    Take Screenshot   06_cadastro_submetido
    Validar Cadastro Sucesso
    Take Screenshot   07_cadastro_sucesso   