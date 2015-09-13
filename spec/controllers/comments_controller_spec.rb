require 'rails_helper'

describe CommentsController do
      let!(:user) { FactoryGirl.create(:user) }
  describe 'GET #new' do
    context 'is logged in' do
      it "assigns a new comment to @comment" do
        session[:user_id] = user.id
        get :new
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end
  end
  describe 'POST #create' do
      let!(:question) { FactoryGirl.create(:question) }
      let!(:answer) { question.answers.create(FactoryGirl.attributes_for(:answer)) }
      context "comment on question" do
        it "creates a new comment associated with the question" do
          expect{
            post :create, id: question.id,
            type: "Question", comment: FactoryGirl.attributes_for(:comment)
          }.to change(question.comments, :count).by 1
        end
      end
      context "comment on answer" do
        it "creates a new comment associated with the answer" do
          expect{
            post :create, id: answer.id,
            type: "Answer", comment: FactoryGirl.attributes_for(:comment)
          }.to change(answer.comments, :count).by 1
        end
      end
  end

  describe 'GET #edit' do
    let!(:question) { FactoryGirl.create(:question) }
    let!(:comment) { question.comments.create(FactoryGirl.attributes_for(:comment).merge(author_id: session[:user_id]))}
    it "assigns requested comment to @comment" do
      session[:user_id] = user.id
      get :edit, id: comment.id
      expect(assigns(:comment)).to eq comment
    end
    it "renders edit template" do
      get :edit, id: comment.id
      expect(response).to render_template :edit
    end
  end

  # describe 'PATCH #update' do
  #   let!(:question) { FactoryGirl.create(:question) }
  #   let!(:comment) { question.comments.create(FactoryGirl.attributes_for(:comment).merge(author_id: session[:user_id]))}

  #   context 'valid comment' do
  #     it "updates requested comment" do
  #       old_content = comment.content
  #       new_content = "new-content"
  #       patch :update, id: comment.id, comment: { content: new_content }
  #       comment.reload
  #       expect(comment.content).to eq new_content
  #     end
  #   end

  #   context 'invalid comment' do
  #     it "does not update" do
  #       old_content = comment.content
  #       patch :update, id: comment.id, comment: { content: nil }
  #       comment.reload
  #       expect(comment.content).to eq old_content
  #     end
  #   end
  # end
  # describe 'DELETE #destroy' do
  #   let!(:question) { FactoryGirl.create(:question) }
  #   let!(:comment) { question.comments.create(FactoryGirl.attributes_for(:comment).merge(author_id: session[:user_id]))}
  #   it "destroys selected content" do
  #     expect {
  #       delete :destroy, id: comment.id
  #     }.to change(question.comments.count).by -1
  #     end
  #   end
end
