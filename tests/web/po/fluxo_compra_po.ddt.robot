*** Settings ***
Resource    ../../../pages/base_page.robot
Test Template    Fluxo de Compra
                                       
*** Test Cases ***
TC001    São Paolo    New York    
TC002    San Diego    Rome    
TC003    Mexico City    Dublin   
TC004    Philadelphia    London    
TC005    Portland    Cairo  

*** Keywords ***
Fluxo de Compra
    [Arguments]    ${city_departure}    ${city_destination}  

    Element Text Should Be    ${mensagem_primeira_pagina}    Welcome to the Simple Travel Agency!    
    Tirar Screenshot    1-Página inicial
    Selecionar Cidade de Origem    ${city_departure}     
    Selecionar Cidade de Destino    ${city_destination}   
    Tirar Screenshot    2-Origem e destino
    Clicar no botao "Find Flight"   

    Element Text Should Be    ${mensagem_segunda_pagina}    Flights from ${city_departure} to ${city_destination}:
    Tirar Screenshot    3-Página escolher voo
    Clicar no botao "Choose This Flight"   
    
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
    
    Element Text Should Be    ${mensagem_quarta_pagina}    Thank you for your purchase today!
    Tirar Screenshot    6-Página final                       