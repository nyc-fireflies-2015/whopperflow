require 'rails_helper'
include LoginMacros

describe QuestionsController, type: :controller do
	let!(:user) { FactoryGirl.create(:user) }

	describe 'GET #new' do
		context 'is logged in' do
      it "assigns a new question to @question" do
        login(user)
        get :new
        expect(assigns(:question)).to be_a_new(Question)
      end
    end
	end

	describe 'POST #create' do
    context 'valid answer' do
      before :each do
        login(user)
        post :create, question: FactoryGirl.attributes_for(:question)
      end
      it "creates a new question in the database" do
      	expect(Question.count).to eq 1
      end
      it "redirects to Question#show" do
        # binding.pry
        expect(response).to redirect_to Question.last
      end
    end
    # context 'invalid answer' do
    #   it "creates a new answer in the database" do
    #     expect{
    #       post :create, id: question.id,
    #         answer: {content: nil}
    #     }.to change(questions.answers.count).by 0
    #   end
    #   it "redirects to answers#new" do
    #     post :create, id: question.id,
    #     answer: {content: nil}
    #     expect(response).to redirect_to new_answer
    #   end
    # end
  end

end