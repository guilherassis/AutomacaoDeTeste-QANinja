
# Desafio
# Implementar o Delete
# Dica, é extremamente parecido com o Get Unique Spot


describe "DELETE /spots/:id" do
    before(:all) do
        result = SpotApi.new.session({email: "guilher@contoso.io"})
        @user_id = result.parsed_response["_id"]
    end

    describe "when delete spot" do

        before(:all) do
            spot= { thumbnail: "contoso.jpg", company: "Contoso", techs: ["java", "ytesds"], price: 20, user: @user_id.to_mongo_id }
                
            @spot_id = MongoDb.new.save_spot(spot)
            @result = SpotApi.new.remove_spot(@user_id, @spot_id)
        
        end

        it "should return clear" do
            expect(@result.response.code).to eql "204"
        end

        it "should return empty body" do
            expect(@result.parsed_response).to be_nil
        end

        after(:all) do
            result = SpotApi.new.find_spot(@user_id, @spot_id)
            expect(result.response.code).to eql "404"
        end

    end

    describe "when spot does not exist" do

        before(:all) do
            
            @spot_id = MongoDb.new.mongo_id
            @result = SpotApi.new.remove_spot(@user_id, @spot_id)
        
        end

        it "should return clear" do
            expect(@result.response.code).to eql "204"
        end

        it "should return empty body" do
            expect(@result.parsed_response).to be_nil
        end

    end

end
