require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:users) { create_list(:user, 10) }
  let(:user) { create(:user) }

  describe 'GET #index' do

    before {get :index }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: user.id } }

    it 'returns user' do
      subject
      expect(assigns(:user)).to eq user
    end
  end
  
  describe 'POST #create' do
    subject { post :create, params: { user: attributes_for(:user) } }

    it 'creates a user' do
      expect{ subject }.to change( User, :count ).by 1
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { id: user.id, user: attributes_for(:user) } }

    it 'updates a user' do
      user.reload
      expect{ subject }.to change( User, :count ).by 0
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: user.id } }

    
    it 'deletes a user' do
      user.reload
      expect{ subject }.to change( User, :count ).by -1
    end
  end

end
