require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      expect(response).to be_success
    end
  end

  describe "GET 'signup'" do
    it "returns http success" do
      get 'signup'
      expect(response).to be_success
    end
  end

end
