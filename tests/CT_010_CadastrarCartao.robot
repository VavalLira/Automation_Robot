*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource
Resource    ../resources/keywords/Cartao.resource
Resource    ../resources/pages/PagamentoPage.resource


*** Test Cases ***
Finalizar Compra com Cartão de Teste
     [Documentation]    Cadastra um cartão de teste durante o checkout e valida a compra.
     [Tags]    cartao
  
    Verificar homepage
    Ir Para Login
    Criar Nova Conta 
    Take Screenshot   01_cadastro_sucesso
    Pesquisar Produto    ${PRODUTO_BUSCA}
    Take Screenshot   05_busca_produto_sucesso
    Adicionar Produto
    Take Screenshot   08_carrinho_com_produto
    Fazer checkout
    Take Screenshot   09_checkout
    Finalizar Compra
    Take Screenshot   10_pagina_pagamento
    Gerar Dados do Cartão
    Cadastrar Cartão
    Take Screenshot   11_cadastro_cartao
    Validar Compra Sucesso
    Take Screenshot   12_compra_sucesso
        

