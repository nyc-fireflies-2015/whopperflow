require 'rails_helper'

describe AnswersController do
      let!(:user) { FactoryGirl.create(:user) }
  describe 'GET #new' do
    context 'is logged in' do
      it "assigns a new answer to @answer" do
        login(user)
        get :new
        expect(assigns(:answer)).top be_a_new(Answer)
      end
    end
  end
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
    it "assigns requested answer to @answer" do
      answer = question.answers.create(FactoryGirl.attributes_for(:answer))
      get :edit, id: answer.id
      expect(assigns(:answer)).to eq answer
    end
    it "renders edit template" do
      answer = question.answers.create(FactoryGirl.attributes_for(:answer))
      get :edit, id: answer.id
      expect(assigns(response)).to render_template :edit
    end
  end
  describe 'PATCH #update' do
    context 'valid answer' do

    end
    context 'invalid answer' do

    end
  end
  describe 'DELETE #destroy' do
    context 'is author' do


    end
    context 'not author' do


    end
  end
end
