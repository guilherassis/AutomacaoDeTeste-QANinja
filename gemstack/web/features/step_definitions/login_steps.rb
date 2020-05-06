Dado("que eu tenho o email {string}") do |email|
    @email = email
end

Dado("acesso a pagina de login") do
    visit "https://spotlab.herokuapp.com/"
    #sleep 5 
end

Quando("eu submeto este email") do
    #email é o nome do label/id do campo
    campo_email = find ("#email")
    campo_email.set @email

    click_button "Entrar"

end

Então("devo ver a área de administração de spots") do
    #--------
    #é feita uma pergunta se existe a classe/div chamada dashboard no css
    #res = page.has_css?(".dashboard")

    #valida se existe
    #expect(res).to be true
    #--------
    
    #alternativa simplificada para o codigo acima
    expect(page).to have_css(".dashboard")

end

Então("devo ver a mensagem de alerta : {string}") do |expect_alert|
    alert = find(".alert-dark")
    expect(alert).to have_text(expect_alert)
end