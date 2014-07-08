require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let(:user) {User.create(email:'test@dbc.com', 
                password_digest: '1121233', 
                admin?: false)}

  describe "GET 'login'" do
    it "returns http success" do
      post 'login', params: { email: 'test@dbc.com', password: "1121233"}
      expect(response).to be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post 'create'
      expect(response).to be_success
    end
  end

end
