***Settings***
Documentation       Cadastro de Planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Calcular preço total do plano

    &{plan}     Create Dictionary       title=Plano Law      duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be    ${plan.total}

Cenario: Novo Plano
    &{plan}         Create Dictionary       title=Plano Sunny       duration=12     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Submit Plan Form
    Toaster Text Should Be      Plano cadastrado com sucesso

    [Teardown]                  Thinking And Take Screenshot  2

Cenario: Campos Título e Duração devem ser obrigatoriios
    
    @{expected_alerts}          Set variable    Informe o título do plano       Informe a duração do plano em meses
    @{got_alerts}               Create List

    Go To Plans
    Go To Form Plan
    Submit Plan Form

    FOR     ${index}    IN RANGE   1   3
            ${span}     Get Required Alerts     ${index} 
            Append To List      ${got_alerts}               ${span}
    END

    Log             ${expected_alerts}
    Log             ${got_alerts}

    Lists Should Be Equal            ${expected_alerts}      ${got_alerts}

Cenario: A duração deve ser no mínimo 1 mês
    
    &{plan}         Create Dictionary       title=Plano Usopp       duration=0     price=19,99     total=R$ 239,88

    Go To Plans
    Go To Form Plan
    Fill Plan Form              ${plan}
    Submit Plan Form
    Alert Text Should Be        A duração dever ser no mínimo 1 mês

    ## robot -d ./logs tests\plans\create.robot