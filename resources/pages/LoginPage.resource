*** Settings ***
Documentation     Ações da página de login

Library          Browser

Resource        ../../data/variables.robot
       

*** Keywords ***

Ir Para Login
    Log   Navegando para a página de login    console=true
    Click    ${SELECTOR_SIGNUP_LOGIN} 
    Log    Página de login carregada    console=true

Preencher Login
    [Arguments]    ${email}    ${senha}
    Fill Text    input[data-qa="login-email"]    ${email}
    Log    Campo email preenchido com: ${email}    console=true
    Fill Text    input[data-qa="login-password"]    ${senha}
    Log    Campo senha preenchido com: ${senha}    console=true

Submeter Login
    Click    button[data-qa="login-button"]
    Log    Botão de login clicado    console=true

Validar Login Sucesso
    Wait For Elements State    text=${MSG_LOGGED_IN}    visible
    Get Url    ==    ${URL_BASE}/
    Log    Login bem-sucedido!    console=true

Validar Login Invalido
    Wait For Elements State    ${SELECTOR_SIGNUP_LOGIN}    visible    timeout=10s
    Get Url    ==    ${URL_LOGIN}
    Log    Login inválido - Usuário redirecionado para página de login    console=true

Realizar Logout
    Click    ${SELECTOR_LOGOUT}
    Log    Botão de logout clicado    console=true

Validar Logout Sucesso
    Wait For Elements State    ${SELECTOR_SIGNUP_LOGIN}    visible    timeout=10s
    Get Url    ==    ${URL_LOGIN}
    Log    Logout realizado com sucesso - Usuário redirecionado para página de login    console=true

Clicar no botão de excluir conta
    Click    ${SELECTOR_EXCLUIR_CONTA}
    Log    Botão de excluir conta clicado    console=true
    
Validar Conta Excluida
    Wait For Elements State    text=${MSG_ACCOUNT_DELETED}    visible    timeout=10s
    Get Url    ==    ${URL_BASE}/delete_account    
    Log    Conta excluída com sucesso!    console=true    