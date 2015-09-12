require 'rails_helper'

describe UsersController do
  describe 'POST #create' do
    it "creates a new answer in the database" do
      expect{
        post :create, user: FactoryGirl.attributes_for(:user)
      }.to change(User, :count).by 1
    end
    it "redirects invalid user to new user path" do
      post :create, user: {username: nil, password: nil}
      expect(response).to redirect_to new_user_path
    end
  end
  describe 'POST #login' do
    user = FactoryGirl.create(:user)
    it "Logins in valid user" do
      post :login, user: { username: user.username, password: user.password }
      expect(response).to redirect_to user_url(user)
    end
    it "redirects invalid user to users path" do
      post :login, user: { username: nil, password: nil }
      expect(response).to redirect_to users_path
    end
  end
end
