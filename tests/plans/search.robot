***Settings***
Documentation       Buscar os planos
Resource            ${EXECDIR}/resources/base.robot

Suite Setup         Start Admin Session
Test Teardown       Take Screenshot

***Test Cases***
Cenario: Busca exata
    &{plan}         Create Dictionary       title=Zeta       duration=12     price=19.99     total=R$ 239.88


    Remove Plan By Title        ${plan.title}
    Insert Plan                 ${plan}
    Go To Plans     
    Search Plan By Title        ${plan.title}
    Plan Should Be Visible      ${plan.title}
    Total Items Should Be       1

Cenario: Registro não Encontrado

    ${title}                        Set Variable       Dom Flamingo  
    Remove Plan By Title            ${title}
    Go to Plans
    Search Plan By Title            ${title}
    Register Should Not Be Found

Cenario: Buscar títulos já cadastrado pelo titulo
    ${fixtures}                 Get JSON            plans-search.json
    ${plans}                    Set Variable        ${fixtures['plans']} 
    ${word}                     Set Variable        ${fixtures['word']}
    ${total}                    Set Variable        ${fixtures['total']}

    Remove Plan By Title        Plano

    FOR     ${item}     IN      @{plans}
        Insert Plan     ${item}
    END

    Go To Plans
    Search Plan By Title        ${word}

    FOR     ${item}     IN      @{plans}
        Plan Title Should Be Visible    ${item['title']}
    END

    Total Items Should Be  ${total}  

## robot -d ./logs tests\plans\search.robot