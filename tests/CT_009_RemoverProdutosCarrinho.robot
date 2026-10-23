*** Settings ***
Library    Browser

Test Setup       Abrir Navegador 
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***
Adicionar Produto ao Carrinho
    [Tags]    carrinho
    Verificar homepage
    Fazer Login    ${email}    ${senha}
    Take Screenshot   02_login_Valido
    Pesquisar Produto    ${PRODUTO_BUSCA}
    Take Screenshot   05_busca_produto_sucesso
    Adicionar Produto
    Take Screenshot   08_carrinho_com_produto
    Remover Produto do Carrinho
    Take Screenshot   09_carrinho_vazio
    Verifique se o produto foi removido do carrinho