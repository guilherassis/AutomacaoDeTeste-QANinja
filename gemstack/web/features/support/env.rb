require "capybara"
require "capybara/cucumber"
require "mongo"
require "selenium-webdriver"
require "site_prism"


Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "https://spotlab.herokuapp.com"
    
    # Caso a aplicação tenha delay para mostrar a tela, agora o capybara tem 5 seg para encontrar os elementos
    config.default_max_wait_time = 5
end

# Adicionando um novo metodo na classe String ruby
class String 
    def to_mongo_id
        BSON::ObjectId.from_string(self)
    end
end