
Quando("eu submeto a sessao com {string}") do |email|
    # Classe login instanciada no hooks.rb
    @login.with(email)
end

Então("devo ver a área de administração de spots") do
    # Classe dash instanciada no hooks.rb
    expect(@dash.has_dashboard?).to be true
end

Então("devo ver a mensagem de alerta : {string}") do |expect_alert|
    # Classe login instanciada no hooks.rb
    expect(@login.alert).to have_text(expect_alert)
end