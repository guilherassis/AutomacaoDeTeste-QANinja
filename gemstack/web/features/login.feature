#language: pt

Funcionalidade: Login
    Para que eu passa ter acesso a interface de administração de spots
    Sendo um usuário que possui um bom email
    Quero poder iniciar uma nova sessão

    
    Cenario: Nova sessao

    Dado que eu tenho o email "guilherme@acme.com"
    E acesso a pagina de login
    Quando eu submeto este email
    Então devo ver a área de administração de spots
    
    
    Cenario: Email ruim

    Dado que eu tenho o email "guilherme##acme.com"
    E acesso a pagina de login
    Quando eu submeto este email
    Então devo ver a mensagem de alerta : "Oops. Informe um email válido!"

    
    Cenario: Email branco

    Dado que eu tenho o email ""
    E acesso a pagina de login
    Quando eu submeto este email
    Então devo ver a mensagem de alerta : "Oops. Informe um email válido!"
