*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***
Adicionar Produto ao Carrinho
    [Tags]    carrinho
    Verificar homepage
    Ir Para Login
    Preencher Login    ${email}    ${senha}
    Take Screenshot   01_login_Preenchido
    Submeter Login
    Validar Login Sucesso
    Take Screenshot   02_login_Valido
    Clica na aba Produtos
    Preencher Busca       ${PRODUTO_BUSCA}
    Take Screenshot   03_busca_produto_preenchida
    Submeter Busca
    Take Screenshot  04_busca_produto_submetida
    Validar Busca Sucesso
    Take Screenshot   05_busca_produto_sucesso
    Clicar no Produto
    Take Screenshot   06_detalhes_produto
    Adicinar quantidade 
    Adicionar ao Carrinho
    Take Screenshot   07_produto_adicionado
    Checar nome do modal
    Validar Produto no Carrinho
    Take Screenshot   08_carrinho_com_produto
    
    
        

