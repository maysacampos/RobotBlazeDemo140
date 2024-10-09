*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${mensagem_primeira_pagina}    css=body:nth-child(2) div.jumbotron:nth-child(2) div.container > h1:nth-child(1)
${choose_departure_city}    name=fromPort
${choose_destination_city}    name=toPort
${btn_find_flights}    css=body:nth-child(2) div.container:nth-child(3) form:nth-child(2) div.container:nth-child(6) > input.btn.btn-primary    

*** Keywords ***

Selecionar Cidade de Origem   
    [Arguments]    ${city_departure}      
    Select From List By Value    ${choose_departure_city}    ${city_departure}  

Selecionar Cidade de Destino
    [Arguments]    ${city_destination}
    Select From List By Value    ${choose_destination_city}    ${city_destination}      
    
Clicar no botao "Find Flight"
    Click Button    ${btn_find_flights}        