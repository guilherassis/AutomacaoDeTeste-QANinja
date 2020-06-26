Dado("Estou logado como {string}") do |email|
  @login.with(email)
  # chama o elemento dashboard no dash_page (do SitePrism), caso queira limitar o tempo de espera, colocar o wait, caso n queira, só tirar.
  @dash.wait_until_dashboard_visible(wait: 5)

  # Pegar o Id do usuário logado atraves deo javascript, ppara confirmar, ir no console do navegador e colocar o código abaixo 
  js_script = "window.localStorage.getItem('user');"
  @user_id = page.evaluate_script(js_script)
  
end
  
Dado("que eu tenho o seguinte spot:") do |table|
  @spot_data = table.rows_hash
end

Dado ("este é um novo spot") do
  # Deleta o spot que tiver o mesmo nome para garantir que este será um novo spot
  MongoDb.new.remove_spot(@spot_data["company"], @user_id)
  
end

Quando("eu faço o cadastro dessas informações") do
 
 @dash.go_to_form
 # Classe dash instanciada no hooks.rb
 @dash.form.create(@spot_data)
end

Então("devo ver um novo spot com o valor da diária {string}") do |price|
  expect(@dash.item(@spot_data["company"])).to have_text price
end

Então("devo ver uma mensagem de alerta {string} no dashboard") do |expect_message|
   expect(@dash.alert).to have_text expect_message
end