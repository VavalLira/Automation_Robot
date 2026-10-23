*** Settings ***
Documentation    Ações e elementos da página Home

Library          Browser

Resource        ../../data/variables.robot

*** Keywords ***
Fazer checkout

    Wait For Elements State    xpath=//a[contains(text(), "Proceed To Checkout")]    visible    timeout=10s
    Click    xpath=//a[contains(text(), "Proceed To Checkout")]
    Wait For Elements State    xpath=//h2[contains(text(), "Address Details")]    visible    timeout=10s
    Log    Página de checkout carregada com sucesso!    console=true
    
Finalizar Compra
    Click    xpath=//a[contains(text(), "Place Order")]
    Wait For Elements State    xpath=//h2[contains(text(), "Payment")]    visible    timeout=10s
    Log    Página de pagamento carregada com sucesso!    console=true

Cadastrar Cartão
    Fill Text    xpath=//input[@name="name_on_card"]    ${NOME_CARTAO}
    Fill Text    xpath=//input[@name="card_number"]    ${NUMERO_CARTAO}
    Fill Text    xpath=//input[@name="cvc"]            ${CVC_CARTAO}
    Fill Text    xpath=//input[@name="expiry_month"]   ${MES_EXPIRACAO_CARTAO}
    Fill Text    xpath=//input[@name="expiry_year"]    ${ANO_EXPIRACAO_CARTAO}
    Log    Dados do cartão preenchidos com sucesso!    console=true


Validar Compra Sucesso
    Click    xpath=//button[@id="submit"] 
    Wait For Condition    URL    contains    /payment_done/    timeout=20s
    Wait For Elements State    xpath=//p[contains(., "Congratulations! Your order has been confirmed!")]    visible    timeout=20s
    Wait For Elements State    xpath=//h2[@data-qa="order-placed" and normalize-space(.)="Order Placed!"]    visible    timeout=20s
    Log    Pedido finalizado com sucesso!    console=true