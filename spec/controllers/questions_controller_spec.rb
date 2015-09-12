require 'rails_helper'
include LoginMacros

describe QuestionsController, type: :controller do
	let!(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do
    context 'questions page' do
      it 'assigns all questions to @questions' do
        get :index
        expect(assigns(:questions)).to eq Question.all
      end
    end
  end

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
    context 'valid question params' do
      before :each do
        login(user)
        post :create, question: FactoryGirl.attributes_for(:question)
      end

      it "creates a new question in the database" do
      	expect(Question.count).to eq 1
      end

      it "redirects to Question#show" do
        expect(response).to redirect_to Question.last
      end
    end

    context 'invalid question params' do
      before :each do
        login(user)
        # binding.pry
        # post :create, question: FactoryGirl.attributes_for(:invalid_question)
        post :create, question:{title: "Hello World", content: nil}
      end

      it "does not create a question in the database" do
        expect(response).to render_template :new
      end
      # it "redirects to answers#new" do
    #     post :create, id: question.id,
    #     answer: {content: nil}
    #     expect(response).to redirect_to new_answer
    #   end
    end
  end

end