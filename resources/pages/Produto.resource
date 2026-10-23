*** Settings ***
Documentation    Ações e elementos da página Home

Library          Browser

Resource        ../../data/variables.robot

*** Keywords ***

Clica na aba Produtos
    Log    Clicando na aba de produtos    console=true
    Click    xpath=//a[contains(text(), "Products")]
    Sleep    3s
    Log    Página de produtos carregada    console=true

Preencher Busca
    [Arguments]    ${produto}
    Fill Text    xpath=//input[@id="search_product"]    ${produto}
    Log    Campo de busca preenchido com: ${produto}    console=true

Submeter Busca
    Click    xpath=//button[@id="submit_search"]
    Log    Botão de busca clicado    console=true

Validar Busca Sucesso
    Wait For Elements State    xpath=//h2[contains(text(), "Searched Products")]    visible    timeout=180
    Log    Busca realizada com sucesso!    console=true

Clicar no Produto
    Click    xpath=//a[contains(text(), "View Product")]
    Log    Clicando no produto encontrado    console=true

Adicinar quantidade
    Wait For Elements State    xpath=//input[@id="quantity"]    visible    timeout=10s
    Fill Text    xpath=//input[@id="quantity"]    2
    Log    Quantidade do produto preenchida com: 2    console=true

Adicionar ao Carrinho
    Click     xpath=//button[@class="btn btn-default cart"]   
    Log    Botão de adicionar ao carrinho clicado    console=true
    
Checar nome do modal
    Wait For Elements State   xpath=//div[@id="cartModal"]    visible  timeout=180
    Log    Modal de produto visível    console=true
    
    #Validar mensagem no modal
    Wait For Elements State   xpath=//div[@id="cartModal"]//h4[contains(text(), "Added!")]    visible     timeout=180
    Log    Produto adicionado ao carrinho com sucesso!    console=true
    Click    xpath=//button[contains(text(), "Continue Shopping")]
    Log    Fechando modal de produto    console=true

Validar Produto no Carrinho
    Click    xpath=//a[contains(text(), "Cart")]
    Log    Navegando para a aba do carrinho    console=true

    Sleep    2s
    Get Url    ==    ${URL_BASE}/view_cart

    # Aguardar tabela do carrinho carregar
    Wait For Elements State    xpath=//table[@id="cart_info_table"]    visible    timeout=10s
    Log    Tabela do carrinho visível    console=true
    Wait For Elements State    xpath=//table[@id="cart_info_table"]//tr[.//a[contains(normalize-space(.), "${PRODUTO_BUSCA}")]]    visible    timeout=180
    
    # Validar quantidade
    ${qtd}=    Get Text    xpath=//table[@id="cart_info_table"]//tr[.//a[contains(normalize-space(.), "${PRODUTO_BUSCA}")]]//button[contains(@class, "disabled")]
    Should Not Be Empty    ${qtd}
    ${qtd_numero}=    Convert To Integer    ${qtd}
    Should Be True    ${qtd_numero} > 0
    Log    Produto adicionado ao carrinho com quantidade: ${qtd}    console=true

Validar Pagina de Produtos
    Wait For Elements State    xpath=//h2[contains(text(), "All Products")]    visible    timeout=30s
    Get Url    ==    ${URL_BASE}/products
    Log    Página de produtos carregada com sucesso    console=true

Clicar no Primeiro Produto
    Click    xpath=(//a[contains(text(), "View Product")])[1]
    Log    Clicando no primeiro produto da lista    console=true

Validar Detalhes do Produto
    # Validar URL do produto
    ${url_atual}=    Get Url
    Should Contain    ${url_atual}    /product_details/
    Log    URL do produto validada: ${url_atual}    console=true

    Sleep    2s
    
    # Validar nome do produto está visível
    Wait For Elements State    xpath=//div[@class="product-information"]//h2    visible    timeout=10s
    Log    Nome do produto visível    console=true
    
    # Validar categoria está visível
    Wait For Elements State    xpath=//div[@class="product-information"]//p[contains(text(), "Category")]    visible
    Log    Categoria do produto visível    console=true
    
    # Validar preço está visível
    Wait For Elements State    xpath=//div[@class="product-information"]//span//span    visible
    ${preco}=    Get Text    xpath=//div[@class="product-information"]//span//span
    Should Not Be Empty    ${preco}
    Log    Preço do produto validado: ${preco}    console=true

    
    # Validar disponibilidade (CORRIGIDO)
    Wait For Elements State    xpath=//div[@class="product-information"]//p[contains(., "Availability")]    visible    timeout=10s
    ${disponibilidade}=    Get Text    xpath=//div[@class="product-information"]//p[contains(., "Availability")]
    Should Not Be Empty    ${disponibilidade}
    Log    Disponibilidade: ${disponibilidade}    console=true
    
    # Validar condição do produto
    Wait For Elements State    xpath=//div[@class="product-information"]//p[contains(., "Condition")]    visible    timeout=10s
    ${condicao}=    Get Text    xpath=//div[@class="product-information"]//p[contains(., "Condition")]
    Should Not Be Empty    ${condicao}
    Log    Condição: ${condicao}    console=true
    
    # Validar marca
    Wait For Elements State    xpath=//div[@class="product-information"]//p[contains(., "Brand")]    visible    timeout=10s
    ${marca}=    Get Text    xpath=//div[@class="product-information"]//p[contains(., "Brand")]
    Log    Marca: ${marca}    console=true
    
    Log    Todos os detalhes do produto foram validados com sucesso!    console=true

Remover Produto do Carrinho
    Log    Removendo produto do carrinho    console=true
    Click    xpath=//a[contains(text(), "Cart")]
    Wait For Elements State    xpath=//table[@id="cart_info_table"]//a[@class="cart_quantity_delete"]    visible    timeout=10s
    Click    xpath=//table[@id="cart_info_table"]//a[@class="cart_quantity_delete"]
    Wait For Elements State    xpath=//table[@id="cart_info_table"]//a[@class="cart_quantity_delete"]    hidden    timeout=10s
    Log    Produto removido do carrinho    console=true

Verifique se o produto foi removido do carrinho
    Wait For Elements State    xpath=//p[contains(., "Cart is empty!")]    visible    timeout=10s
    Log    Produto removido do carrinho com sucesso! Carrinho vazio.    console=true

