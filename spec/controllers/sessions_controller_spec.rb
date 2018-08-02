# frozen_string_literal: true

require 'rails_helper'
RSpec.describe SessionsController, type: :controller do
  def create_user
    @user = User.create!(name: 'Luan', email: 'example-1@railstutorial.org', password: 'password', password_confirmation: 'password', activated: true)
  end
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'Login success' do
      it 'returns http success' do
        create_user
        post :create, params: { session: { email: 'example-1@railstutorial.org', password: 'password' } }
        expect(response).to redirect_to(@user)
      end
    end
  end

  describe 'POST #create' do
    context 'Login error' do
      it 'returns http error' do
        create_user
        post :create, params: { session: { email: '12example-1@railstutorial.org', password: 'password1' } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'Login success' do
      it 'returns http success' do
        delete :destroy
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
