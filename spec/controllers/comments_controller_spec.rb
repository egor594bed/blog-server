require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:users) { create_list(:user, 10) }
  let(:category) { create(:category) }
  let(:post) { create(:post, user: users.sample, category: category) }
  let(:comment) { create(:comment, post: post, user: users.sample) }

  describe 'POST #create' do
    subject { post :create, params: { key: category.key, post_id: post.id, comment: attributes_for(:comment) } }

    it 'creates a comment' do
      expect(comment).to be_persisted
      expect(response).to have_http_status(:ok)
    end
  end

  # No route matches
  describe 'PUT #update' do
    subject { put :update, params: { key: category.key, post_id: post.id, id: comment.id, comment: attributes_for(:comment) } }

    it 'updates a comment' do
      comment.reload
      expect{ subject }.to change( Comment, :count ).by 0
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { key: category.key, post_id: post.id, id: comment.id } }

    it 'deletes a comment' do
      comment.reload
      expect{ subject }.to change( Comment, :count ).by -1
    end
  end

end
