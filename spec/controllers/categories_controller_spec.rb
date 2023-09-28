require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:categories) { create_list(:category, 10) }
  let(:category) { create(:category) }

  describe 'GET #index' do

    before {get :index }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { category: attributes_for(:category) } }

    it 'creates a category' do
      expect{ subject }.to change( Category, :count ).by 1
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { key: category.key, category: attributes_for(:category) } }

    it 'updates a category' do
      category.reload
      expect{ subject }.to change( Category, :count ).by 0
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { key: category.key } }

    
    it 'deletes a user' do
      category.reload
      expect{ subject }.to change( Category, :count ).by -1
    end
  end

end
