#language: pt


# Login implementado em hooks dentro do before
@login
Funcionalidade: Cadastro de Spots
    Sendo um anunciante
    Quero poder cadastrar alguns spots de empresas
    Para que eu possa disponibilizar para locação

    Contexto: Sessão do usuário
        * Estou logado como "guilherme@ninja.oi"
    

    @smoke
    Cenario: Novo spot
       
        Dado que eu tenho o seguinte spot:
            | company  | Google      |
            | thumbnail| google.jpg  |
            | techs    | java,golang |
            | price    | 10          |
        E este é um novo spot
        Quando eu faço o cadastro dessas informações 
        Então devo ver um novo spot com o valor da diária "R$10/dia"

    
    Cenario: Spot grátis

        Dado que eu tenho o seguinte spot:
            | company  | Yahoo      |
            | thumbnail| yahoo.jpg  |
            | techs    | elixir     |
            | price    |            |
        E este é um novo spot
        Quando eu faço o cadastro dessas informações 
        Então devo ver um novo spot com o valor da diária "GRATUITO"

    @doing
    Esquema do Cenario: Cadastro incompleto
    
        Dado que eu tenho o seguinte spot:
            | company  | <company>   |
            | thumbnail| <thumb>     |
            | techs    | <techs>     |
            | price    | <price>   |
        Quando eu faço o cadastro dessas informações 
        Então devo ver uma mensagem de alerta "<message>" no dashboard

        # Abrange todos os casos de testes de cadastro incompletos.
        Exemplos:
            | company | thumb     | techs  | price | message                              |
            | Yahoo   |           | elixir | 10    | Precisamos da foto da sua empresa!   |
            |         | yahoo.jpg | elixir | 20    | O nome da sua empresa é obrigatório! |
            | Yahoo   | yahoo.jpg |        | 30    | Informe pelo menos uma tecnologia :) |




