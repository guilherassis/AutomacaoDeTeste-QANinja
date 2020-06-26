#language: pt

Funcionalidade: Login
    Para que eu passe ter acesso a interface de administração de spots
    Sendo um usuário que possui um bom email
    Quero poder iniciar uma nova sessão

    
    Cenario: Nova sessao
        
            Quando eu submeto a sessao com "guilherme@ninja.oi"
            Então devo ver a área de administração de spots
    
    
    #Tecnica de DDT
    Esquema do Cenario: Tentativas 
        
           Quando eu submeto a sessao com "<email>"
            Então devo ver a mensagem de alerta : "<mensagem>"

            #Massa de teste - Testa o email ruim e depois o email em branco
            Exemplos:
            | email               | mensagem                       | 
            | guilherme##acme.com | Oops. Informe um email válido! |
            |                     | Oops. Informe um email válido! |