require 'rails_helper'

describe UsersController do
  describe 'POST #create' do
    context 'valid answer' do
      let!(:question) { FactoryGirl.create(:question) }
      it "creates a new answer in the database" do
        expect{
          post :create, id: question.id,
          answer: FactoryGirl.attributes_for(:answer)
        }.to change(question.answers.count).by 1
      end
      it "redirects to Question#show" do
        post :create, id: question.id,
        answer: FactoryGirl.attributes_for(:answer)
        expect(response).to redirect_to question_path(question)
      end
    end
    context 'invalid answer' do
      it "creates a new answer in the database" do
        expect{
          post :create, id: question.id,
            answer: {content: nil}
        }.to change(questions.answers.count).by 0
      end
      it "redirects to answers#new" do
        post :create, id: question.id,
        answer: {content: nil}
        expect(response).to redirect_to new_answer
      end
    end
  end
  describe 'GET #edit' do
    let!(:answer) { question.answers.create(FactoryGirl.attributes_for(:answer)) }
    it "assigns requested answer to @answer" do
      get :edit, id: answer.id
      expect(assigns(:answer)).to eq answer
    end
    it "renders edit template" do
      get :edit, id: answer.id
      expect(assigns(response)).to render_template :edit
    end
  end
  describe 'PATCH #update' do
    let!(:answer) { question.answers.create(FactoryGirl.attributes_for(:answer)) }
    context 'valid answer' do
      it "updates requested answer" do
        old_content = answer.content
        new_content = "new-content"
        patch :update, id: answer.id, { content: new_content }
        answer.reload
        expect(answer.content).to eq new_content
      end
    end
    context 'invalid answer' do
      it "does not update" do
        old_content = answer.content
        patch :update, id: answer.id, { content: nil }
        answer.reload
        expect(answer.content).to eq old_content
      end
    end
  end
  describe 'DELETE #destroy' do
    it "destroys selected content" do
      expect {
        delete :destroy, id: answer.id
      }.to change(question.answers.count).by -1
    end
  end
end
