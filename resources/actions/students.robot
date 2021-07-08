***Settings***
Documentation           Ações da feature de gestão de alunos  ## KW para os cadastro de Novos Alunos

***Variables***
${NAME_FIELD}                    css=input[name=name]
${EMAIL_FIELD}                   css=input[name=email]   
${AGE_FIELD}                     css=input[name=age]          
${WEIGHT_FIELD}                  css=input[name=weight]      
${FEET_TALL_FIELD}               css=input[name=feet_tall]      

***Keywords***

                ###### FORMULARIOS  ######

# Clica no botão salvar 
Submit Student Form
    Click                           xpath=//button[contains(text(), "Salvar")]

# Cadatra um novo Aluno
New Students
    [Arguments]                      ${student}    ## ${name}     ${email}        ${age}      ${weight}      ${feet_tall} antes do da super variavel "& dictionary" estava se passando assim

    # ações do cenário
    Fill Text                       ${NAME_FIELD}                   ${student.name}
    Fill Text                       ${EMAIL_FIELD}                  ${student.email}
    Fill Text                       ${AGE_FIELD}                    ${student.age}
    Fill Text                       ${WEIGHT_FIELD}                 ${student.weight}
    Fill Text                       ${FEET_TALL_FIELD}              ${student.feet_tall}

    Submit Student Form

# Edita um aluno cadastrado
Update A Students
    [Arguments]                      ${student}                     ## para chamar uma variavel que busca no json se passa ['']

    # ações do cenário
    Fill Text                       ${NAME_FIELD}                   ${student['name']}
    Fill Text                       ${EMAIL_FIELD}                  ${student['email']}
    Fill Text                       ${AGE_FIELD}                    ${student['age']}
    Fill Text                       ${WEIGHT_FIELD}                 ${student['weight']}
    Fill Text                       ${FEET_TALL_FIELD}              ${student['feet_tall']}

    Submit Student Form

# Busca por um aluno pelo nome na lista
Search Student By Name
    [Arguments]             ${name}

    Fill Text               css=input[placeholder="Buscar aluno"]               ${name}

            ###### LINKS & BOTÕES ######

# Vai para o formulario de cadastro de Novo Aluno
Go To Form Studants
    Click                           css=a[href$="alunos/new"]
    Wait For Elements State        css=h1 >> text=Novo aluno               visible         5

# Faz a ação de clicar no botão de editar atraves da busca por email
Go to Student Update Form 
    [Arguments]       ${email}

    Click             xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State        css=h1 >> text=Edição de aluno        visible         5

# Solicitação para Remover um aluno por email
Request Removal By Email
    [Arguments]         ${email}
    Click               xpath=//td[contains(text(), "${email}")]/../td//button[@id="trash"]

# Confirma exclusaão do aluno
Confirm Removal
    Click               text=SIM, pode apagar!

# Desistir da exclusão do aluno
Cancel Removal 
    Click               text=NÃO


                ######  VALIDAÇÃO   ######

# Verifica na Tabela se o aluno  FOI REMOVIDO
Student Should Not Visible 
    [Arguments]             ${email}

    Wait For Elements State        xpath=//td[contains(text(), "${email}")]     detached     5

# Verifica na Tabela se o aluno esta na lista
Student Should Be Visible 
    [Arguments]             ${email}

    Wait For Elements State        xpath=//td[contains(text(), "${email}")]     visible      5

## Verifica se o nome buscado esta visivel
Student Name Should Be Visible
    [Arguments]                 ${name}

    Wait For Elements State     css=table tbody tr >> text=${name}              visible         5
