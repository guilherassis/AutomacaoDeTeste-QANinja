require "httparty"

class SpotApi
    attr_reader :url
    include HTTParty
 
    
    def initialize
        @url = "https://spotlab-api.herokuapp.com"
    end

    def user_id(email)
         result = self.class.post(
                @url + "/sessions",
                body: {email: email }.to_json,
                headers: { "content-type": "application/json" }
        )
        return result.parsed_response["_id"]
    end

    def save_spot(payload, user_id)
        return self.class.post(
               @url + "/spots",
                body: payload,
                headers: { "user_id" => user_id}
        )
    end

end



