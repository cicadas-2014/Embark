require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  let!(:user) {User.create(email:'test@dbc.com', 
                password_digest: '1121233', 
                admin?: false)}

  describe "GET 'login'" do
    it "returns http success" do
      post 'login', params: { authenticity_token: "muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM=", email: 'tet@dbc.com', password: "1121233"}
      expect(response).to redirect_to(home_path)
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post 'create', params: { authenticity_token: "muFKWZ/nJiE4Ud4AscCadtka+ZyRDxuEV22WZw3/lBM=", email: 'tet@dbc.com', password: "1121233"}
      expect(response).to redirect_to(home_path)
    end
  end

end
