***Settings***
Documentation       Remover os planos
Resource            ${EXECDIR}/resources/base.robot

Suite Setup          Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Remover plano cadastrado

    &{plan}      Create Dictionary      title=Plano Teach      duration=12   price=25.00
    Insert Plan                         ${plan}
    Go To Plans
    Search Plan By Title                ${plan.title}
    Request Removal By Title            ${plan.title}
    Confirm Removal
    Toaster Text Should Be              Plano removido com sucesso
    Plan Should Not Visible             ${plan.title}

    [Teardown]                          Thinking And Take Screenshot  2

Cenario: Desistir da exclusão

    &{plan}      Create Dictionary      title=Plano OnePiece      duration=12     price=19.99
    
    Insert Plan                         ${plan}
    Go To Plans
    Reload
    Search Plan By Title                ${plan.title}
    Request Removal By Title            ${plan.title}
    Cancel Removal
    Plan Should Be Visible              ${plan.title}

## robot -d ./logs tests\plans\remove.robot