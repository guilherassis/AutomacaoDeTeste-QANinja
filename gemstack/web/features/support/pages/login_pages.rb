

class LoginPage < SitePrism::Page
    # A URL esta sendo definida no env.rb ,  aqui passa somente a barra, pois é o caminho para o login
    set_url "/"
    # o elemento identificado na pagina, substitui o find
    element :input_email, "#email"
    element :alert, ".alert-dark"

   

    def with (email)
        # Buscar pelo id do campo 
        # campo_email = find("#email")
        # Caso queira pegar o campo email por placeholder
        # campo_email = find("input[placeholder='Seu melhor e-mail']")
        # Caso queira pegar o campo email pela ultima palavra do placeholder(utilizando expressão regular)

        # self é utilizado pora chamar o elemento da propria pagina
        self.input_email.set email
        click_button "Entrar"
    end

end