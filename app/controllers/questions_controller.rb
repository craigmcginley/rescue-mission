class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    authenticate!
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    if @question.save
      redirect_to question_path(@question)
    else
      flash.now[:notice] = "Unable to submit your question, please follow these requirements:"
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(question_params)
      redirect_to question_path(@question)
    else
      flash.now[:notice] = "Unable to submit your question, please follow these requirements:"
      render :'questions/edit'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    question = Question.find(params[:id])
    question.answers.each do |answer|
      answer.destroy
    end
    question.destroy
    flash[:notice] = "Your question was removed."
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body, :user_id)
  end

end
