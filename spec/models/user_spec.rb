require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {User.create(username: 'test', 
  							email:'test@dbc.com', 
  							password_digest: '1121233', 
  							admin?: false)}

  it "has valid email" do
  	expect(user.email).to be_valid
  end

  it "is not an admin" do
  	expect(user.admin?).to be false
  end

  it "should have a password" do 
  	expect(user.password). to be true
  end

end