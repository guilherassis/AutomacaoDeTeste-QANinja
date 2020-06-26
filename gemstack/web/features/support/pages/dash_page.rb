
# Classe herda classe Section do SitePrism
class SpotForm < SitePrism::Section
    # ELementos do mapa de cadastro do spot
    element :thumbnail,"#thumbnail input"
    element :company,"input[placeholder*=empresa]"
    element :techs, "#techs"
    element :price, "#price"
    element :submit, "button[type=submit]"

    def create(spot)
        
        # -------------
        # Alternativa
        # Atribui temporariamente um id para o elemento e para que fique mais fácil achar
        # js_script = "document.querySelector('#thumbnail input').setAttribute('id','thumb')"
        # page.execute_script(js_script)
        # attach_file("thumb",thumbnail)
        # -------------
    
        # O Capybara por padrão ignora elementos ocultos, e o input esta sendo ocultado pelo css(display=none). 
        # Com isso estamos desabilitando esta função somente no momento desta linha, utilizando visible: false    
        # thumbnail é o pai do file, por isso que tivemos que encontror por estrutura.

        # Traz o valor do thumbnail do arquivo cadastro.feature
         if spot["thumbnail"].size > 0
            thumb_file = Dir.pwd + '/features/support/images/' + spot["thumbnail"]
            thumbnail(visible: false).set thumb_file
        end

        company.set spot["company"]
        techs.set spot["techs"]
        price.set spot["price"]
    
        submit.click
      
    end   


end



# Classe herda classe Page do SitePrism
class DashPage < SitePrism::Page
    # INstanciando a classe SpotForm acima, o #spotForm é o ID do form no portal spotlab(teoricamenteo o id pai dos elementos) e o SpotForm a classe acima
    section :form, SpotForm, "#spotForm"
    element :dashboard, ".dashboard"
    element :spot_list, ".spot-list li"
    element :alert, ".alert-error"

    def go_to_form
        click_button "Cadastrar novo spot"
    end
    
    # Utilizando SitePrism e sem necessidade de usar o metodo abaixo, guardado para conhecimento
    # metodo que termina com interrogação é um metodo booleano, retorna verdadeiro ou falso
    #def logged_user?

         #--------
        #é feita uma pergunta se existe a classe/div chamada dashboard no css
        #res = page.has_css?(".dashboard")

        #valida se existe
        #expect(res).to be true
        #--------
        
        #alternativa simplificada para o codigo acima
        #expect(page).to have_css(".dashboard")

    #    return page.has_css?(".dashboard")
    #end

         

    def item(company)
        return spot_list(text: company)
    end

   
end