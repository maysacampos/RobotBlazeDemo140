*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    escolher_destino_page.robot
Resource    escolher_voo_page.robot
Resource    preencher_cadastro_page.robot
Resource    thankYou_page.robot

*** Variables ***

${timeout}    5000ms
${url}    https://www.blazedemo.com/
${browser}    Chrome
${date}
${screenshot_path}    C:\\ITERASYS\\RobotBlazeDemo140\\screenshots

*** Keywords ***

Abrir navegador
    Register Keyword To Run On Failure    Tirar Screenshot
    Obter Data e hora
    Open Browser    url=${url}    browser=${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    10000ms
    Wait Until Element Contains   css=body:nth-child(2) div.jumbotron:nth-child(2) div.container > h1:nth-child(1)    Welcome to the Simple Travel Agency!   

Fechar navegador
    Sleep    500ms      
    Close Browser

Obter Data e hora
    ${date}=    Get Current Date  
    ${date}=    Convert Date    ${date}    result_format=%Y.%m.%d_%H.%M
    ${date}    Set Global Variable    ${date}
    
Tirar Screenshot    
     [Arguments]    ${screenshot_name}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
    Capture Page Screenshot    screscreenshot/${date}/${TEST_NAME}/${screenshot_name}.jpg

    #C:\ITERASYS\RobotBlazeDemo140\screenshots

