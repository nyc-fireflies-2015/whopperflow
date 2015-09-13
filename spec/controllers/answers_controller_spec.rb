require 'rails_helper'
include LoginMacros

describe AnswersController do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  # describe 'GET #new' do
  #   context 'is logged in' do
  #     it "assigns a new answer to @answer" do
  #       login(user)
  #       get :new
  #       expect(assigns(:answer)).top be_a_new(Answer)
  #     end
  #   end
  # end
  describe 'POST #create' do
    context 'with valid attributes' do
    	before :each do
    		login(user)
    	end

      it "creates a new answer in the database" do
      	# binding.pry
        expect{
          post :create, id: question.id,
          answer: FactoryGirl.attributes_for(:answer)
        }.to change(Answer, :count).by 1
      end

      it "redirects to Question#show" do
        post :create, id: question.id,
        answer: FactoryGirl.attributes_for(:answer)
        expect(response).to redirect_to question_path(question)
      end
    end
    # context 'with invalid attributes' do
    #   it "creates a new answer in the database" do
    #     expect{
    #       post :create, id: question.id,
    #         answer: {content: nil}
    #     }.to change(Answer, :count).by 0
    #   end
    #   it "redirects to answers#new" do
    #     post :create, id: question.id,
    #     answer: {content: nil}
    #     expect(response).to redirect_to new_answer
    #   end
    # end
  end

  describe 'GET #edit' do
    let!(:answer) { question.answers.create(FactoryGirl.attributes_for(:answer)) }

    it "assigns requested answer to @answer" do
    	# binding.pry
    	login(user)
      get :edit, id: answer.id
      expect(assigns(:answer)).to eq answer
    end
    # it "renders edit template" do
    #   get :edit, id: answer.id
    #   expect(assigns(response)).to render_template :edit
    # end
  end
  # describe 'PATCH #update' do
  #   let!(:answer) { question.answers.create(FactoryGirl.attributes_for(:answer)) }
  #   context 'valid answer' do
  #     it "updates requested answer" do
  #       old_content = answer.content
  #       new_content = "new-content"
  #       patch :update, id: answer.id, answer: { content: new_content }
  #       answer.reload
  #       expect(answer.content).to eq new_content
  #     end
  #   end
  #   context 'invalid answer' do
  #     it "does not update" do
  #       old_content = answer.content
  #       patch :update, id: answer.id, answer: { content: nil }
  #       answer.reload
  #       expect(answer.content).to eq old_content
  #     end
  #   end
  # end
  # describe 'DELETE #destroy' do
  #   it "destroys selected content" do
  #     expect {
  #       delete :destroy, id: answer.id
  #     }.to change(question.answers.count).by -1
  #   end
  # end
end
