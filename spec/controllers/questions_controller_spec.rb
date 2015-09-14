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
    context 'with valid attributes' do
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
  end

  describe 'GET #edit' do
    context 'edit existing question' do
      before :each do
<<<<<<< HEAD
        login(user)
=======
        session[:user_id] = user.id
>>>>>>> cf86e40bb79b39d1c5abe46945617e2cc7011d2e
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

  describe 'PATCH #update' do
    before :each do
      @question = FactoryGirl.create(:question, title: "What is html?", content: "Please tell me more")
    end

    context 'with valid attributes' do
      it 'locates the requested @question' do
        patch :update, id: @question.id, question: FactoryGirl.attributes_for(:question)
        expect(assigns(:question)).to eq @question
      end

      it "changes @question's attributes" do
        patch :update, id: @question.id, question: FactoryGirl.attributes_for(:question, title: "What is AJAX?", content: "Please tell me more")
        @question.reload
        expect(@question.title).to eq "What is AJAX?"
        expect(@question.content).to eq "Please tell me more"
      end

      it 'redirects to the updated question' do
        patch :update, id: @question.id, question: FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to @question
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the question' do
      expect{delete :destroy, id: question.id}.to change(Question, :count).by -1
    end

    it 'redirects to index' do
      delete :destroy, id: question.id
      expect(response).to redirect_to questions_path
    end
  end

end