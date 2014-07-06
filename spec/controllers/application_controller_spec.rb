require 'spec_helper'

describe ApplcationController do
  let!(:application) { create :application }
  describe "GET#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET#show" do
    it "is successful" do
      get :show, id: fg_problem.id
      expect(response).to be_success
    end
  end

  describe "GET#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST#create" do
    context "when problem is invalid" do

    end

    context "when problem is valid" do

    end
  end
end