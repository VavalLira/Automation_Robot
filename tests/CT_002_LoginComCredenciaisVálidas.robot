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
    Criar Nova Conta 
    Take Screenshot   06_cadastro_sucesso
    
    # Fazer logout
    Click    ${SELECTOR_LOGOUT}   
    

    # Fazer login com os dados criados
    Fazer Login    ${email}    ${senha}
    Take Screenshot   08_login_Valido