require 'rails_helper'

RSpec.describe User, :type => :model do
  let!(:user) {User.create(email:'test@dbc.com', 
  							password_digest: '1121233', 
  							admin?: false)}

  it "has valid email" do
  	expect(user).to respond_to(:email)
  end

  it "is not an admin" do
  	expect(user.admin?).to be false
  end

end