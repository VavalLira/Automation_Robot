*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***

Busca de Produto
    [Tags]    busca
    Verificar homepage
    Ir Para Login
    Preencher Login    ${email}    ${senha}
    Take Screenshot   01_login_Preenchido.png
    Submeter Login
    Validar Login Sucesso
    Take Screenshot   02_login_Valido.png
    Pesquisar Produto    ${PRODUTO_BUSCA}
    Take Screenshot   05_busca_produto_sucesso.png

