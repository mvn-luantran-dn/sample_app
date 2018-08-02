# frozen_string_literal: true

require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    context 'Sign up success' do
      it 'returns http success' do
        post :create, params: { user: { name: 'Luan', email: 'example-1@railstutorial.org', password: 'password', password_confirmation: 'password', activated: true } }
        expect(response).to redirect_to(User.last)
      end
    end

    context 'Sign up error email' do
      it 'returns http error email' do
        post :create, params: { user: { name: 'Luan', email: 'example', password: 'password', password_confirmation: 'password', activated: true } }
        expect(response).to render_template(:new)
      end
    end
  end
end
