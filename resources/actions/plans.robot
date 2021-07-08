***Settings***
Documentation           Ações da feature de gestão de planos  ## KW para os cadastro de Novos Planos


***Variables***
${TITLE_FIELD}                  id=title
${DURATION_FIELD}               id=duration
${PRICE_FIELD}                  css=input[name=price]
${TOTAL_FIELD}                 css=input[name=total]

***Keywords***
                ###### FORMULARIOS  ######

# Clica no botão salvar 
Submit Plan Form
    Click                           xpath=//button[contains(text(), "Salvar")]

# Preenche um novo plano
Fill Plan Form 
    [Arguments]                     ${plan}    
    Fill Text                       ${TITLE_FIELD}                     ${plan.title}
    Fill Text                       ${DURATION_FIELD}                  ${plan.duration}
    Fill Text                       ${PRICE_FIELD}                     ${plan.price}

# Preenche o formulario de alteração do plano 
Update a Plan
    [Arguments]                     ${plan}
    Fill Text                       ${TITLE_FIELD}                     ${plan['title']}
    Fill Text                       ${DURATION_FIELD}                  ${plan['duration']}
    Fill Text                       ${PRICE_FIELD}                     ${plan['price']}
    Submit Plan Form


    Submit Student Form

            ###### LINKS & BOTÕES ######

# Vai para o formulario de cadastro de Novo Plano
Go To Form Plan
    Click                           css=a[href$="planos/new"]
    Wait For Elements State        css=h1 >> text=Novo plano               visible         5

                ######  VALIDAÇÃO   ######
# Pega o valor total do plano
Total Plan Should Be
    [Arguments]         ${total}

    Get Attribute       ${TOTAL_FIELD}          value      ==      ${total}
# Atualiza um novo plano
Go To Plan Update Form
    [Arguments]                 ${plan}
    Click                       xpath=//td[contains(text(),'${plan}')]/..//a[@class='edit']
    Wait For elements State     css=h1 >> text=Edição de plano     visible         5
# Remove um novo plano
Request Removal By Title
    [Arguments]                 ${title}
    Click                       xpath=//td[contains(text(),"${title}")]/../td/button[@id="trash"]
# O plano não deve estar visível
Plan Should Not Visible
    [Arguments]                 ${title}
    Wait For Elements State     xpath=//td[contains(text(),"${title}")]   detached    5

# Busca um plano pelo Titulo
Search Plan By Title
    [Arguments]                 ${title}
    Fill Text                   css=input[placeholder="Buscar plano"]       ${title}
# O plano deve estar visível
Plan Should Be Visible
    [Arguments]                 ${title}
    Wait For Elements State     xpath=//td[contains(text(),"${title}")]   visible    5