require 'rails_helper'
include LoginMacros

describe QuestionsController, type: :controller do
	let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }


  describe 'GET #index' do
    context 'questions page' do
      before :each do
        get :index
      end
      it 'assigns all questions to @questions' do
        expect(assigns(:questions)).to eq Question.all
      end

      it "renders the index template" do
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    context 'view specific question' do
      before :each do
        get :show, id: question.id
      end

      it 'assigns the requested question to @question' do
        expect(assigns(:question)).to eq question
      end

      it 'renders the show template' do
        expect(response).to render_template :show
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
      end

      it "creates a new question in the database" do
        expect{post :create, question: FactoryGirl.attributes_for(:question)}.to change(Question, :count).by 1
      end

      it "redirects to Question#show" do
        post :create, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to question_path(assigns[:question])
      end
    end

    # context 'invalid question params' do
    #   before :each do
    #     login(user)
        # binding.pry
        # post :create, question: FactoryGirl.attributes_for(:invalid_question)
        # post :create, question:{title: "Hello World", content: nil}
      # end

      # it "does not create a question in the database" do
      #   expect(response).to render_template :new
      # end
      # it "redirects to answers#new" do
    #     post :create, id: question.id,
    #     answer: {content: nil}
    #     expect(response).to redirect_to new_answer
    #   end
    # end
  end

  describe 'GET #edit' do
    context 'edit existing question' do
      before :each do
        get :edit, id: question.id
      end
      it 'assigns the requested question to @question' do
        expect(assigns(:question)).to eq question
      end

      it 'renders the edit template' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'PATCH #update'

end