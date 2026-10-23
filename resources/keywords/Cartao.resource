*** Settings ***
Library    String
Resource   ../../data/variables.robot

*** Keywords ***
Gerar Dados do Cartão
    [Documentation]    Gera dados sintéticos para o formulário de cartão de teste.
    # Gera um número de cartão de teste válido (Visa)
    ${numero_cartao}=    Set Variable    4111 1111 1111 1111
    Set Global Variable    ${NUMERO_CARTAO}    ${numero_cartao}   
     
    ${nome_cartao}=    Generate Random String    10    [LETTERS]
    ${nome_cartao_formatado}=    Set Variable    TESTE-${nome_cartao}
    Set Global Variable    ${NOME_CARTAO}    ${nome_cartao_formatado}

    ${cvc_cartao}=    Generate Random String    3    [NUMBERS]
    Set Global Variable    ${CVC_CARTAO}    ${cvc_cartao}

    ${mes_expiracao}=    Evaluate    str(random.randint(1, 12)).zfill(2)    modules=random
    Set Global Variable    ${MES_EXPIRACAO_CARTAO}    ${mes_expiracao}

    ${ano_expiracao}=    Evaluate    str(datetime.datetime.now().year + random.randint(2, 5))    modules=datetime,random
    Set Global Variable    ${ANO_EXPIRACAO_CARTAO}    ${ano_expiracao}
    Log    Dados sintéticos do cartão preparados.


