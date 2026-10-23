*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***

Criar Conta e Fazer Login
    [Tags]    cadastro    login
    Verificar homepage
    Ir Para Login
    Take Screenshot   01_login
    Criar Conta
    Take Screenshot   02_cadastro
    Preencher Dados da Conta
    Take Screenshot   03_dados_conta
    Preencher Endereco
    Take Screenshot   04_endereco
    Submeter Cadastro
    Take Screenshot   05_cadastro_submetido
    Validar Cadastro Sucesso
    Take Screenshot   06_cadastro_sucesso
    
    # Fazer logout
    Click    ${SELECTOR_LOGOUT}   
    

    # Fazer login com os dados criados
    Ir Para Login
    Preencher Login    ${email}    ${senha}
    Take Screenshot   07_login_preenchido
    Submeter Login
    Validar Login Sucesso
    Take Screenshot   08_login_Valido