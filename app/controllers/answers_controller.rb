class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to "/questions/#{@question.id}"
    else
      flash.now[:notice] = "Unable to save your answer, please follow the requirements."
      render :'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
