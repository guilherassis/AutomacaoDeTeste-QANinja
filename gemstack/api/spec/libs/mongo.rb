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



    def remove_company(company, user_id)

        query = {company: company, user: user_id.to_mongo_id }
        spotsCollection.delete_many(query)
     
    end

    #salva uma lista de spots
    def save_spots(spots)
        # debug
        # puts spots

        # spots.first irá deletar todos os sports do primeiro usuario do array,
        # como para todas as posições do array estou usando o mesmo usuário, com isso todos serão deletados
        spotsCollection.delete_many({ user: spots.first[:user] })
        spotsCollection.insert_many(spots)
    end

    #salva um unico spots
     def save_spot(spot)
        
        spotsCollection.delete_many({ user: spot[:user] })
        result = spotsCollection.insert_one(spot)
        return result.inserted_id
    end

    def mongo_id
        return BSON::ObjectId.new
    end

    


    #Metodos privados
    private
    
    #Conexão com o banco
    def client
        #O link é formado por tipoDoBanco://usuario:senha@host:port/database?retryWrites=false
        return client = Mongo::Client.new("mongodb://qaninja:qaninja123@ds035664.mlab.com:35664/spotdb?retryWrites=false")

    end

    def spotsCollection
        #Usa o metodo acima client para conectar no banco e trazer a tabela spots
        return client[:spots]
    end

    def usersCollection
        #Usa o metodo acima client para conectar no banco e trazer a tabela/collections users
        return client[:users]
    end
  
end
