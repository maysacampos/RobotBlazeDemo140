*** Settings ***
Resource    ../../../pages/base_page.robot

Test Setup    base_page.Abrir navegador
Test Teardown    base_page.Fechar navegador

*** Test Cases ***
Fluxo de compra
    # Verifica se a página inicial contém a mensagem esperada
    Page Should Contain    ${mensagem_primeira_pagina}    Welcome to the Simple Travel Agency!
    Tirar Screenshot    1-Página inicial

    # Seleciona cidades de origem e destino
    Selecionar Cidade de Origem    Boston     
    Selecionar Cidade de Destino    London    
    Tirar Screenshot    2-Origem e destino
    
    # Clica no botão para encontrar voos
    Clicar no botao "Find Flight"   
    Wait Until Element Is Visible    css=h3  # Aguarda a mensagem de voos
    Element Text Should Be    ${mensagem_segunda_pagina}    Flights from Boston to London:
    Tirar Screenshot    3-Página escolher voo

    # Seleciona um voo
    Clicar no botao "Choose This Flight"   
    Wait Until Element Is Visible    css=h2  # Aguarda a mensagem de reserva
    Element Text Should Be    ${mensagem_terceira_pagina}    Your flight from TLV to SFO has been reserved.
    Tirar Screenshot    4-Cadastro vazio

    # Preenche o cadastro
    Preencher campo Name    Maysa Campos
    Preencher campo Adress    Av Junho, 445 
    Preencher campo City    Salvador
    Preencher campo State    Bahia
    Preencher campo Zip Code    3550000 
    Preencher Credit Card Number    2234805020508585
    Preencher campo Month    10 
    Preencher campo Year    2030
    Preencher campo Name on Card    Maysa Campos 
    Clicar em Remember me    
    Tirar Screenshot    5-Cadastro preenchido

    # Finaliza a compra
    Clicar no botao "Purchase Flight"   
    Wait Until Element Is Visible    css=h1  # Aguarda a mensagem final
    Element Text Should Be    ${mensagem_quarta_pagina}    Thank you for your purchase today!
    Tirar Screenshot    6-Página final
