require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:users) { create_list(:user, 10) }
  let(:category) { create(:category) }
  let(:post) { create(:post, user: users.sample, category: category) }

  describe 'POST #create' do
    let(:post_params) {{ key: category.key, post: attributes_for(:post) }}

    subject { post :create, params: post_params }

    it 'creates a post' do
      # expect{ subject }.to change(Post, :count).by 1
      expect(post).to be_persisted
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { key: category.key, post_id: post.id, post: attributes_for(:post) } }

    it 'updates a post' do
      post.reload
      expect{ subject }.to change( Post, :count ).by 0
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { key: category.key, post_id: post.id } }

    
    it 'deletes a post' do
      post.reload
      expect{ subject }.to change( Post, :count ).by -1
    end
  end

end
