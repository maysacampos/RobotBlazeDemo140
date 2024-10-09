*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${mensagem_segunda_pagina}    css=h3
${btn_choose_this_flight}    css=div.container:nth-child(2) table.table:nth-child(2) tbody:nth-child(2) tr:nth-child(5) td:nth-child(2) > input.btn.btn-small    

*** Keywords ***

Clicar no botao "Choose This Flight"
    Click Button    ${btn_choose_this_flight}       