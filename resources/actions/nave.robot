***Settings***
Documentation       Ações do menu superior de navegador (APP ACTIONS)

***Keywords***
## Vai para sessão de navegação de Gestão de Alunos
Go To Students
    Click                           css=a[href$=alunos]
    Wait For Elements State        css=h1 >> text=Gestão de Alunos         visible         5

# Vai para sessão de navegação de Gestão de Planos
Go To Plans
    Click                           css=a[href$=planos]
    Wait For Elements State        css=h1 >> text=Gestão de Planos         visible         5

# Vai para sessão de navegação de Gestão de Matrículas
Go To Enrolls
    Click                           css=a[href$=matriculas]
    Wait For Elements State        css=h1 >> text=Gestão de Matrículas         visible         5

## O usuário deve estar logado
User Should Be Logged In
    [Arguments]         ${user_name}

    #Keyword para verificar igualdade em mensagem de sucesso
    Get Text    css=aside strong    should be       ${user_name}