*** Settings ***
Documentation    Variáveis globais do projeto


*** Variables ***
# URLs
${URL_BASE}                      https://automationexercise.com
${URL_LOGIN}                     ${URL_BASE}/login

# Timeouts
${TIMEOUT_PADRAO}                60s
${TIMEOUT_CURTO}                 10s

# Mensagens de Sucesso
${MSG_CONTA_CRIADA}              Account Created!
${MSG_LOGGED_IN}                 Logged in as
${MSG_LOGOUT_SUCCESS}            You have been successfully logged out

# Mensagens de Erro
${MSG_LOGIN_INVALIDO}            Your email or password is incorrect!
${MSG_EMAIL_EXISTENTE}           Email Address already exist!

# Dados de Teste Fixos (para testes específicos)
${EMAIL_TESTE_VALIDO}            vicente.campos1775584777@test.com
${SENHA_TESTE_VALIDO}            J7S28Et3i853

${EMAIL_TESTE_INVALIDO}          teste.invalido@test.com
${SENHA_TESTE_INVALIDO}          senhaErrada123

# Seletores Comuns
${SELECTOR_SIGNUP_LOGIN}         text=Signup / Login
${SELECTOR_LOGOUT}               text=Logout
${SELECTOR_HOME}                 text=Home

# Produtos de Teste
${PRODUTO_BUSCA}                 Blue Top
${PRODUTO_ID}                    1

${nome}                          ${EMPTY}
${email}                         ${EMPTY}
${senha}                         ${EMPTY}   

${NOME_CARTAO}                   Vicente Campos
${NUMERO_CARTAO}                 5319 6593 5182 6003
${CVC_CARTAO}                    879   
${MES_EXPIRACAO_CARTAO}          01
${ANO_EXPIRACAO_CARTAO}          2027

${SELECTOR_EXCLUIR_CONTA}          text=Delete Account
${MSG_ACCOUNT_DELETED}             Account Deleted!