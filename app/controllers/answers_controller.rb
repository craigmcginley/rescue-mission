class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answer.user_id = session[:user_id]

    if @answer.save
      redirect_to "/questions/#{@question.id}"
    else
      flash.now[:notice] = "Unable to save your answer, please follow these requirements:"
      render :'questions/show'
    end
  end

  def update
    if @answer = Answer.where(best_answer: true).first
      @answer.best_answer = false
      @answer.save!
    end
    @answer = Answer.find(params[:id])
    @answer.best_answer = true
    @answer.save!
    redirect_to question_path(@answer.question_id)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
