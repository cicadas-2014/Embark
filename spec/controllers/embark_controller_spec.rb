require 'spec_helper'

RSpec.describe EmbarkController, :type => :controller do
  # let!(:application) { create :application }


  describe "GET#home" do
    it "is successful" do
      get :home
      expect(response).to be_success
    end
  end

  describe "GET#adventures" do
    it "is successful with local search" do
      get :adventures, search: 'local'
      expect(response).to be_success
    end
    it "is successful with continential search" do
      get :adventures, search: 'local'
      expect(response).to be_success
    end
    it "is successful with global search" do
      get :adventures, search: 'local'
      expect(response).to be_success
    end
  end

  describe "GET#description" do
    it "is successful" do
      get :description, adventure_id: 20
      expect(response).to be_success
    end
  end
end