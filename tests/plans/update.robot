***Settings***
Documentation       Atualizar os planos
Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Atualizar um plano já cadastrado
    ${fixture}          Get JSON             plans-update.json

    ${before}           Set Variable         ${fixture['before']}
    ${after}            Set Variable         ${fixture['after']}

    Remove Plan By Title                    ${before['title']}
    Remove Plan By Title                    ${after['title']}

    Insert Plan                             ${before}
    Go To Plans
    Search Plan By Title                    ${before['title']}
    Go To Plan Update Form                  ${before['duration']}
    Update a Plan                           ${after}
    Toaster Text Should Be                  Plano atualizado com sucesso

    [Teardown]                  Thinking And Take Screenshot            2

    Submit Plan Form


## robot -d ./logs tests\plans\update.robot