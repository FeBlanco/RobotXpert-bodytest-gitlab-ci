***Settings***
Documentation       Ações de componentes genéricos

***Keywords***
            ###### VALIDAÇÃO #######
# O texto do toaster deve ser
Toaster Text Should Be
    [Arguments]         ${expect_text}

    #Unica chamada combinando duas estrategia para pegar toaster
    Wait For Elements State     css=.Toastify__toast-body >> text=${expect_text}       visible        5

# Texto de alerta deve ser
Alert Text Should Be
    [Arguments]         ${expect_text}

    Wait For Elements State     css=form span >> text=${expect_text}        visible        5

# Verificar se os campos do formulario saõ de qual tipo
Field Should Be Type
    [Arguments]                  ${element}     ${type}

    ${attr}     Get Attribute    ${element}     type
    Should Be Equal              ${attr}        ${type}

# Verifica se não tem nenhum registro procurado
Register Should Not Be Found

    Wait For Elements State     css=div >> text=Nenhum registro encontrado.          visible         5
    Wait For Elements State     css=table         detached         5

# Verifica se o total de itens encontrados atraves da busca
Total Items Should Be 
    [Arguments]                 ${number}

    ## Na estrategia de seletor css. Usa-se # para buscar por id e . para buscar por classe
    ${element}                  Set Variable        css=#pagination .total
   
    Wait For Elements State     ${element}          visible         5
    Get Text                    ${element}          ==              Total: ${number}   
     
# Pesquisa o nome do plano pelo titulo
Plan Title Should Be Visible
    [Arguments]                     ${title}
    Wait For Elements State         css=table tbody tr >> text=${title}      visible     5
    
            ###### RETORNA UM ELEMENTO #######

# Verifica os Textos de alertas dos formularios que são obrigatorios
Get Required Alerts 
    [Arguments]             ${index}

    ${span}         Get Text        xpath=(//form//span)[${index}]

    [return]        ${span}