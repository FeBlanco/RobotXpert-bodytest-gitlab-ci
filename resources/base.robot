***Settings***
Documentation   Tudo começa aqui, meu arquivo base do projeto de automação (APP ACTIONS)

Library         Browser
Library         libs/DeloreanLibrary.py
Library         Collections
Library         OperatingSystem
Library         DateTime

Resource        actions/auth.robot
Resource        actions/students.robot
Resource        actions/plans.robot
Resource        actions/enrolls.robot
Resource        actions/nave.robot
Resource        actions/components.robot

***Keywords***
## Iniciar sessão de navegador
Start Browser Session
    New Browser      chromium       False
    New Page         about:blank

## Gancho para que a suite de teste de cadastro_alunos possa começar com a sessão logado no admin
Start Admin Session
    Start Browser Session
    Go To Login Page
    Login With                      admin@bodytest.com      pwd123
    User Should Be Logged In        Administrador

## Limpe o armazenamento local e faça capturas de tela
Clear Local Storage And Take Screenshot
    Take Screenshot
    LocalStorage Clear

# Pensar e fazer uma captura de tela
Thinking And Take Screenshot
    [Arguments]         ${timeout}

    Sleep               ${timeout}
    Take Screenshot

## HELPERS

## Busca por Json
Get JSON
    [Arguments]             ${file_name}

    ${file}             Get File        ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}      Evaluate        json.loads($file)       json

    [return]            ${json_object}
