*** Settings ***
Resource     ../../../pages/base_page.robot   

*** Test Cases ***
Fluxo de compra
    Tirar Screenshot    1-Página inicial
    Selecionar departure city    Paris     
    Selecionar destination city    Buenos Aires    
   Tirar Screenshot    2-Origem e destino
    Clicar no botao "Find Flights"   
    Wait Until Element Is Visible    css=h3  # Aguarda a mensagem de voos
    Element Text Should Be    ${mensagem_segunda_pagina}    Flights from Boston to London:
    Tirar Screenshot    3-Página escolher voo
    Clicar no botao "Choose This Flight"   
    Wait Until Element Is Visible    css=h2  # Aguarda a mensagem de reserva
    Element Text Should Be    ${mensagem_terceira_pagina}    Your flight from TLV to SFO has been reserved.
    Tirar Screenshot    4-Cadastro vazio
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
    Clicar no botao "Purchase Flight"   
    Wait Until Element Is Visible    css=h1  
    Element Text Should Be    ${mensagem_quarta_pagina}    Thank you for your purchase today!
    Tirar Screenshot    6-Página final
