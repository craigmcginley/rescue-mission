class QuestionsController < ApplicationController

  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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
    Question.destroy(params[:id])
    redirect_to questions_path
  end

  private

  def question_params
    # @markdown = markdown
    params.require(:question).permit(:title, :body)
    # @markdown.render(params[:body])
  end

end
