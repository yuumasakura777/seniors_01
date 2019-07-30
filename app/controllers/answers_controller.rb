class AnswersController < ApplicationController

  def edit
    @answer=Answer.find(question_id: params[:question_id])
  end

  def create

    @answer=Answer.new(answer_params)

    if answer.save
      redirect_to question_path
    else
      render :new
    end
  end





  private

    def answer_params
      params.require(:answer).permit(:content)
    end
end
