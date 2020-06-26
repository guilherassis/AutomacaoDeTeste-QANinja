require "mongo"

# host : ds035664.mlab.com
# port: 35664
# Database: spotdb
# user: qaninja
# Password: qaninja123

# Mostrar Log informativo
# Mongo::Logger.logger.level = Logger::INFO

# Gravar log em um arquivo  
Mongo::Logger.logger = Logger.new("./logs/mongo.log")


class MongoDb

    def remove_spot(company,user_id)
        spotsCollection.delete_many({company: company, user: user_id.to_mongo_id})
    end

    def remove_my_spots(user_id)
        spotsCollection.delete_many({ user: user_id.to_mongo_id})
    end

    #Metodos privados daqui para baixo
    private
    
    #Conexão com o banco
    def client

        #O link é formado por tipoDoBanco://usuario:senha@host:port/database?retryWrites=false
        str_conn = "mongodb://qaninja:qaninja123@ds012538.mlab.com:12538/spotdb2?retryWrites=false"
        return client = Mongo::Client.new(str_conn)

    end

    def spotsCollection
        #Usa o metodo acima client para conectar no banco e trazer a tabela spots
        return client[:spots]
    end

   
end
