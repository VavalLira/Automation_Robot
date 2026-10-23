*** Settings ***
Library    Browser

Test Setup       Abrir Navegador
Test Teardown    Run Keyword And Ignore Error    Take Screenshot

Resource    ../resources/Base.resource


*** Test Cases ***

Verificar Detalhes Completos do Produto
    [Tags]    produto    detalhes    
    Verificar homepage
    Take Screenshot   01_homepage
    Clica na aba Produtos
    Take Screenshot   02_pagina_produtos
    Validar Pagina de Produtos
    Take Screenshot   03_produtos_listados
    Clicar no Primeiro Produto
    Take Screenshot   04_acessando_produto
    Validar Detalhes do Produto
    Take Screenshot   05_detalhes_validados