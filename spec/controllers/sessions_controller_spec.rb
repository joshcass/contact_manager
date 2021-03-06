require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#create" do

    it 'logs in a new user' do
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Alice Smith', 'image' => 'http://www.twitter.com/image'},
        'uid' => 'abc123'
      }

      post :create
      user = User.find_by_uid_and_provider('abc123', 'twitter')
      expect(user.name).to eq "Alice Smith"
      expect(controller.current_user.id).to eq user.id
    end

    it 'logs in an existing user' do
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Han Solo', 'image' => 'http://www.twitter.com/image2'},
        'uid' => 'xyz456'
      }
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Han Solo', image: 'http://www.twitter.com/image2')

      post :create
      expect(User.count).to eq 1
      expect(controller.current_user.id).to eq user.id
    end

    it 'redirects to the index page' do
      @request.env["omniauth.auth"] = {
        'provider' => 'twitter',
        'info' => {'name' => 'Han Solo', 'image' => 'http://www.twitter.com/image2'},
        'uid' => 'xyz456'
      }

      post :create
      expect(response).to redirect_to(root_path)
    end
  end

  describe '#destroy' do

    it 'logs out an existing user' do
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Han Solo', image: 'http://www.twitter.com/image2')
      session[:user_id] = user.id
      expect(controller.current_user.id).to eq user.id

      delete :destroy
      expect(controller.current_user).to eq nil
    end

    it 'redirects to the index page' do
      user = User.create(provider: 'twitter', uid: 'xyz456', name: 'Han Solo', image: 'http://www.twitter.com/image2')
      session[:user_id] = user.id

      delete :destroy
      expect(session[:user_id]).to eq nil
      expect(response).to redirect_to root_path
    end
  end
end
