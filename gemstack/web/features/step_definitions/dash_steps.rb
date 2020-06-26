def to_file(file)
    return  File.open(File.join(Dir.pwd,'features/support/images', file))
end

Dado("que o usuário {string} possui {int} spots") do |email, int|           
    
    # utilizando por API
    @email= email
    @user_id = SpotApi.new.user_id(email)
 
    MongoDb.new.remove_my_spots(@user_id)
 
    spots = [
        { thumbnail: to_file("google.jpg"), company: "Google", techs: "java", price: 10},
        { thumbnail: to_file("yahoo.jpg"), company: "Yahoo", techs: "java", price: 10},
        { thumbnail: to_file("qaninja.jpg"), company: "Qa Ninja", techs: "java", price: 10},
        { thumbnail: to_file("acme.jpg"), company: "Acme", techs: "java", price: 10}
    ]
 
    spots.each do |spot| 
        SpotApi.new.save_spot(spot,@user_id)
    end

 

    # implementando na pagina


    # # Refatoração realizada - busca um step dentro do step, no caso esta pegando o step de spot_steps.rb. Pois lá já é feito este passo(dynamics steps)
    # steps %(
    #     * Estou logado como "#{email}"
    # )
    
   

    # # apaga spots pela tela 

    # total = all(".spot-list li").size
    # total.times do
    #     all(".spot-list li").first.find('.delete-icon').click
    #     sleep 1
    # end

    # # daqui para baixo apaga spots pelo banco 

    # # MongoDb.new.remove_my_spots(@user_id)

    # # Atualiza a pagina para aparecer o dash com os spots deletados
    # # visit "/dashboard"

    # # Codigo abaixo utilizado para o teste de apagar pelo banco e pela tela
    # spots = [
    #     { "thumbnail" => "google.jpg", "company" => "Google", "techs" => "java", price: 10},
    #     { "thumbnail" => "yahoo.jpg", "company" => "Yahoo", "techs" => "java", price: 10},
    #     { "thumbnail" => "qaninja.jpg", "company" => "Qa Ninja", "techs" => "java", price: 10},
    #     { "thumbnail" => "acme.jpg", "company" => "Acme", "techs" => "java", price: 10},
    # ]

    # spots.each do |spot| 
    #     @dash.go_to_form
    #     @dash.form.create(spot)
    #     @dash.wait_until_spot_list_visible
    # end

    # sleep 5

  
end                                                                          
                                                                               
Quando("eu acesso o Dashboard") do                                           
   @login.with(@email)
   @dash.wait_until_spot_list_visible(wait: 5)
end                                                                          
                                                                               
Então("devo ver a notificação {string}") do |expect_message|                         
   expect(page).to have_text expect_message
end                                                                          