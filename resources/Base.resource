*** Settings ***
Library    Browser
Library    OperatingSystem


Resource    ./pages/LoginPage.resource
Resource    ./keywords/Produto.resource
Resource    ../data/variables.robot
Resource    ./keywords/Cadastro.resource




*** Keywords ***
Abrir Navegador
    ${executavel_sistema}=    Resolver Executavel Chromium
    # Abrir navegador maximizado
    IF    $executavel_sistema
        New Browser    chromium    headless=False    executablePath=${executavel_sistema}    args=["--start-maximized", "--kiosk"]
    ELSE
        New Browser    chromium    headless=False    args=["--start-maximized", "--kiosk"]
    END
    Set Browser Timeout    ${TIMEOUT_PADRAO}
    
    # Contexto sem limitação de viewport (usa tamanho da tela)
    New Context    viewport=${{None}}
    
    # Abrir página
    New Page    ${URL_BASE}
    
    Log    Navegador aberto em tela cheia    console=true
Verificar homepage
    Log    Verificando se chegou na homepage do Site    console=true
    Go To    https://automationexercise.com/
    Wait For Condition    Title    matches    Início|Home|Automation Exercise    timeout=180
    Log    Homepage verificada com sucesso    console=true


Fechar Navegador
    Close Browser
    Log    Navegador fechado    console=true

Resolver Executavel Chromium
    ${candidatos}=    Create List
    ...    C:/Program Files/Google/Chrome/Application/chrome.exe
    ...    C:/Program Files (x86)/Google/Chrome/Application/chrome.exe
    ...    C:/Program Files (x86)/Microsoft/Edge/Application/msedge.exe
    ...    C:/Program Files/Microsoft/Edge/Application/msedge.exe
    FOR    ${caminho}    IN    @{candidatos}
        ${existe}=    Run Keyword And Return Status    File Should Exist    ${caminho}
        IF    ${existe}
            RETURN    ${caminho}
        END
    END

    RETURN    ${EMPTY}