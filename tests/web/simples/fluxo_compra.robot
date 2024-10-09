*** Settings ***
Library    SeleniumLibrary

Test Teardown    Close Browser  # No final, fecha o navegador

*** Variables ***
${url}       https://www.blazedemo.com/
${browser}    Chrome
${timeout}    10000ms

*** Test Cases ***
Selecionar Passagem
    Dado que acesso o site Blaze Demo
    Quando seleciono uma Cidade de Partida    Paris
    E seleciono uma Cidade de Destino    Buenos Aires
    Clico no botão Encontre Voo    
    Entao sou direcionado para a pagina de Voos de Paris para Buenos Aires
    Quando seleciono a primeira passagem    
    Entao sou direcionado para a pagina da reserva
    E preencho o campo name    Maysa
    E preencho o campo endereço    Av Junho 445
    E preencho o campo cidade    Salvador
    E preencho o campo estado    Bahia
    E preencho o campo cep    35500000
    E preencho o campo cartao    Visa
    E preencho o campo número do Cartao    2234805020508585
    E preencho o campo mes    10
    E preencho o campo adicionar    2030    
    E preencho o campo nome do Cartao    Maysa Campos    
    Quando clico no botao comprar voo
    Entao sou direcionado para a pagina de confirmação

*** Keywords ***
Dado que acesso o site Blaze Demo
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    5000ms

Quando seleciono uma Cidade de Partida
    [Arguments]    ${cidade}
    Wait Until Element Is Visible    name=fromPort    ${timeout}
    Select From List By Value    name=fromPort    ${cidade}

E seleciono uma Cidade de Destino
    [Arguments]    ${cidade}
    Wait Until Element Is Visible    name=toPort    ${timeout}
    Select From List By Value    name=toPort    ${cidade}

Clico no botão Encontre Voo
    Click Button    css=input[type="submit"].btn.btn-primary
    Wait Until Page Contains Element    xpath=//h2[contains(text(), 'Voos disponíveis')]    ${timeout}

Entao sou direcionado para a pagina de Voos de Paris para Buenos Aires
    Page Should Contain    Voos de Paris para Buenos Aires

Quando seleciono a primeira passagem
    Click Element    xpath=/html/body/div[2]/table/tbody/tr[1]/td[1]/input

Entao sou direcionado para a pagina da reserva
    Page Should Contain    Reserve

E preencho o campo name
    [Arguments]    ${name}
    Input Text    name=name    ${name}

E preencho o campo endereço
    [Arguments]    ${endereco}
    Input Text    name=address    ${endereco}

E preencho o campo cidade
    [Arguments]    ${cidade}
    Input Text    name=city    ${cidade}

E preencho o campo estado
    [Arguments]    ${estado}
    Input Text    name=state    ${estado}

E preencho o campo cep
    [Arguments]    ${cep}
    Input Text    name=zip    ${cep}

E preencho o campo cartao
    [Arguments]    ${cartao}
    Select From List By Value    name=cardType    ${cartao}

E preencho o campo número do Cartao
    [Arguments]    ${numero}
    Input Text    name=creditCardNumber    ${numero}

E preencho o campo mes
    [Arguments]    ${mes}
    Input Text    name=creditCardMonth    ${mes}

E preencho o campo adicionar
    [Arguments]    ${ano}
    Input Text    name=creditCardYear    ${ano}

E preencho o campo nome do Cartao
    [Arguments]    ${nome}
    Input Text    name=creditCardName    ${nome}

Quando clico no botao comprar voo
    Click Button    xpath=//input[@value='Purchase Flight']

Entao sou direcionado para a pagina de confirmação
    Page Should Contain    Thank you for your purchase
