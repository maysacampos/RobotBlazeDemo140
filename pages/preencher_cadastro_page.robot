*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${mensagem_terceira_pagina}    css=h2
${txt_name}    id=inputName      
${txt_adress}    id=address      
${txt_city}    id=city     
${txt_state}    id=state      
${txt_zip_code}    id=zipCode            
${txt_credit_card_number}    id=creditCardNumber    
${txt_month}    id=creditCardMonth      
${txt_year}    id=creditCardYear      
${txt_name_on_card}    id=nameOnCard      
${btn_remember_me}    id=rememberMe     
${btn_purchase_flight}    css=div.container:nth-child(2) form:nth-child(9) div.control-group:nth-child(12) div.controls > input.btn.btn-primary      

*** Keywords ***

Preencher campo Name
    [Arguments]    ${name}                  
    Input Text    ${txt_name}    ${name}

Preencher campo Adress
    [Arguments]    ${adress}                  
    Input Text    ${txt_adress}    ${adress}

Preencher campo City
    [Arguments]    ${city}                  
    Input Text    ${txt_city}    ${city}

Preencher campo State
    [Arguments]    ${state}                  
    Input Text    ${txt_state}    ${state}

Preencher campo Zip Code
    [Arguments]    ${zip_code}                  
    Input Text    ${txt_zip_code}    ${zip_code}                    

Preencher Credit Card Number
    [Arguments]    ${card_number}                  
    Input Text    ${txt_credit_card_number}    ${card_number}

Preencher campo Month
    [Arguments]    ${month}                  
    Input Text    ${txt_month}    ${month}

Preencher campo Year
    [Arguments]    ${year}                  
    Input Text    ${txt_year}    ${year}

Preencher campo Name on Card
    [Arguments]    ${name_on_card}                  
    Input Text    ${txt_name_on_card}    ${name_on_card}

Clicar em Remember me                 
    Click Button    ${btn_remember_me}            

Clicar no botao "Purchase Flight"               
    Click Button    ${btn_purchase_flight}             