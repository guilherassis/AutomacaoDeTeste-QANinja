
describe "POST /sessions" do
    
    context 'when send email' do
        before(:all)do
        
             @result = SpotApi.new.session({email: "guilherme@ninja.oi"})
            
        end

        it "should return 200"do
            expect(@result.response.code).to eql 200.to_s
        end

        it "should return session Id" do
            expect(@result.parsed_response["_id"].length).to eql 24            
        end

    end

    context 'when send wrong email' do
        before(:all)do

            api = SpotApi.new
            @result = api.session({email: "guilherme$$ninja.oi"})   

        end

        it "should return 409"do
            expect(@result.response.code).to eql 409.to_s
        end

        it "should return wrong email" do
            expect(@result.parsed_response["error"]).to eql "wrong email"
        end
    end

    context 'when send wrong email' do
        before(:all)do

            api = SpotApi.new
            @result = api.session({email: ""})

        end

        it "should return 412"do
            expect(@result.response.code).to eql 412.to_s
        end

        it "should return required email" do
            expect(@result.parsed_response["error"]).to eql "required email"
        end
    end

    context 'when send without data' do
        before(:all)do

            api = SpotApi.new
            @result = api.session({})  

        end

        it "should return 412"do
            expect(@result.response.code).to eql 412.to_s
        end

        it "should return required email" do
            expect(@result.parsed_response["error"]).to eql "required email"
        end
    end
end