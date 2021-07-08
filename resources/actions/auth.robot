***Settings***
Documentation           Ações de autorização (APP ACTIONS)  ## Autorizações para os testes de Login's


***Keywords***
## Vá para a página de login
Go To Login Page
    Go To         https://bodytest-web-blanco.herokuapp.com/

## Login com
Login With
    [Arguments]         ${email}            ${pass}

    Fill Text           css=input[name=email]           ${email}
    #Fill Text          css=input[placeholder*=senha]   ${pass}
    Fill Text           css=input[name=password]        ${pass}
    Click               text=Entrar


