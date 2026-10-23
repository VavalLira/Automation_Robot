*** Settings ***
Library        DateTime
Library        String
Library        Browser
Library        FakerLibrary     locale=pt_BR


Resource        ../../data/variables.robot


*** Keywords ***

Criar Conta
    #validar se existe o texto "New User Signup!" 
    Wait For Elements State    xpath=//h2[contains(text(), "New User Signup!")]    visible       timeout=180
    Log    Página de cadastro carregada com sucesso ... Iniciando preenchimento    console=true
    
    #Criando dados aleatorios para nome, email e senha
    ${nome}=    Name
    Set Global Variable    ${nome}
    Log    nome gerado: ${nome}    console=true


    # Criar email baseado no nome SEM ACENTOS
    ${nome_lower}=    Convert To Lower Case    ${nome}
    
    # Remover acentos do nome
    ${nome_sem_acentos}=    Evaluate    __import__('unicodedata').normalize('NFKD', '${nome_lower}').encode('ASCII', 'ignore').decode('ASCII')

    ${nome_lower}=    Convert To Lower Case    ${nome_sem_acentos}
    ${nome_sem_espacos}=    Replace String    ${nome_lower}    ${SPACE}    .
    ${timestamp}=    Get Time    epoch
    ${email}=    Set Variable    ${nome_sem_espacos}${timestamp}@test.com
    Set Global Variable    ${email}
    Log    email gerado: ${email}    console=true

    # Gerar senha aleatória
    ${senha}=    Generate Random String    12    [LETTERS][NUMBERS]
    Set Global Variable    ${senha}   
    Log    senha gerada: ${senha}    console=true

    #Criação de conta
    Log    Iniciando criação de conta    console=true

    Fill Text    input[data-qa="signup-name"]    ${nome}
    Log    Campo nome preenchido com: ${nome}    console=true
    Fill Text    input[data-qa="signup-email"]    ${email}
    Log    Campo email preenchido com: ${email}    console=true
    Click    button[data-qa="signup-button"]
    Sleep    2s
    
    Log    Botão de cadastro clicado    console=true
   
  
Preencher Dados da Conta

    Log    Iniciando preenchimento do formulario    console=true
    Wait For Elements State    xpath=//h2[contains(., "Enter Account Information")]    visible    timeout=180
    Log    Formulario de criacao visivel    console=true

    # Validar e selecionar título
    Wait For Elements State    xpath=//input[@name="title" and @value="Mrs"]    visible
    Log    Título "Mrs" visível    console=true    
    
    Click    input[name="title"][value="Mrs"]
    Log    Título selecionado    console=true    

    # Preencher senha
    Fill Text    input[data-qa="password"]    ${senha}
    Log    Campo senha preenchido    console=true

    #Validar se o nome e o email estão preenchidos corretamente
    ${nome_campo}=    Get Property    input[data-qa="name"]    value
    Should Be Equal    ${nome_campo}    ${nome}
    Log    Campo nome validado com sucesso    console=true

    ${email_campo}=   Get Property    input[data-qa="email"]    value
    Should Be Equal    ${email_campo}    ${email}
    Log    Campo email validado com sucesso    console=true

    # Criar e preencher data de nascimento aleatória
    ${dia}=    Evaluate    str(random.randint(1, 28))    modules=random
    ${mes}=    Evaluate    str(random.randint(1, 12))    modules=random
    ${ano}=    Evaluate    str(random.randint(1950, 2000))    modules=random
    
    Log    Data de nascimento gerada: ${dia}/${mes}/${ano}    console=true
    
    Select Options By    select[data-qa="days"]    value    ${dia}
    Select Options By    select[data-qa="months"]    value    ${mes}
    Select Options By    select[data-qa="years"]    value    ${ano}
    Log    Data de nascimento preenchida com sucesso    console=true

    #Clica nos checkboxes de newsletter e ofertas
    Click    input[name="newsletter"]
    Log    Checkbox de newsletter selecionado    console=true
    Click    input[name="optin"]
    Log    Checkbox de ofertas selecionado    console=true


Preencher Endereco
    Log    Iniciando preenchimento do endereço    console=true
    Wait For Elements State    xpath=//h2[contains(., "Address Information")]    visible    timeout=180
    Log    Formulario de criacao visivel    console=true

    # Criar dados aleatórios realistas
    ${sobrenome}=    Last Name
    ${endereco}=     Street Address
    ${estado}=       State Abbr
    ${cidade}=       City
    ${cep}=          Postcode
    ${telefone}=     Phone Number
    
    Log    Preenchendo endereço com dados aleatórios    console=true
    
    # Preencher campos do formulário
    Fill Text    input[data-qa="first_name"]        ${nome}
    Fill Text    input[data-qa="last_name"]         ${sobrenome}
    Fill Text    input[data-qa="address"]           ${endereco}
    Select Options By    select[data-qa="country"]  value    Canada
    Fill Text    input[data-qa="state"]             ${estado}
    Fill Text    input[data-qa="city"]              ${cidade}
    Fill Text    input[data-qa="zipcode"]           ${cep}
    Fill Text    input[data-qa="mobile_number"]     ${telefone}
    
    Log    Endereço preenchido - Nome: ${nome} ${sobrenome}, Cidade: ${cidade}, Tel: ${telefone}    console=true

Submeter Cadastro
    Click    button[data-qa="create-account"]

Validar Cadastro Sucesso
    Wait For Elements State    text=${MSG_CONTA_CRIADA}    visible

    #Clicar no botão de continuar
    Click    xpath=//a[contains(text(), "Continue")]

Tentar criar conta com email já cadastrado
    [Arguments]    ${email_existente}=${EMAIL_TESTE_VALIDO}    ${nome_qualquer}=Usuario Teste
    
    Wait For Elements State    xpath=//h2[contains(text(), "New User Signup!")]    visible
    Fill Text    input[data-qa="signup-name"]    ${nome_qualquer}
    Fill Text    input[data-qa="signup-email"]    ${email_existente}
    Click    button[data-qa="signup-button"]
    Log    Tentativa de cadastro com email: ${email_existente}    console=true
    
Validar mensagem de erro
    Wait For Elements State    text=${MSG_EMAIL_EXISTENTE}    visible
    Log    Validação de email duplicado funcionou corretamente    console=true