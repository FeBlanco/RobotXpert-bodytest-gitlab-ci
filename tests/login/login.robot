***Settings***
Documentation       Suite de testes de Login do Administrador

Resource        ${EXECDIR}/resources/base.robot

Suite Setup     Start Browser Session
Test Teardown   Take Screenshot

***Test Cases***
Cenario: Login do Administrador 
    Go To Login Page
#Nova Keyword chamando em auth.robot (personalizadas)
    Login With                      admin@bodytest.com      pwd123
    User Should Be Logged In        Administrador
#Depois do Test ele limpa o teste, para os outros cenarios passarem.
    [Teardown]      Clear Local Storage And Take Screenshot

Cenario: Senha incorreta 
    Go To Login Page
    Login With                  admin@bodytest.com          abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos
    [Teardown]      Thinking And Take Screenshot            2

Cenario: Email não cadastrado 
    Go To Login Page
    Login With                  felipe@bodytest.com          abc123
    Toaster Text Should Be      Usuário e/ou senha inválidos
    [Teardown]      Thinking And Take Screenshot            2

Cenario: Email incorreto
    Go To Login Page
    Login With                  admin&bodytest.com          pwd123
    Alert Text Should Be        Informe um e-mail válido

Cenario: Senha não informada
    Go To Login Page
    Login With                  admin@bodytest.com          ${EMPTY}
    Alert Text Should Be        A senha é obrigatória

Cenario: Email não informado
    Go To Login Page
    Login With                  ${EMPTY}                    pwd123
    Alert Text Should Be        O e-mail é obrigatório

Cenario: Email e senha não informado
    Go To Login Page
    Login With                  ${EMPTY}                    ${EMPTY}
    Alert Text Should Be        O e-mail é obrigatório
    Alert Text Should Be        A senha é obrigatória




#Comando no cmder dentro da pasta para rodar esse teste =  robot -d ./logs tests\login.robot
#Comando no cmder dentro da pasta para rodar esse teste com a tag admin =  robot -d ./logs -i admin tests\login.robot
#Comando no cmder dentro da pasta para rodar esse teste com a tag temp =  robot -d ./logs -i temp tests\login.robot