class AnswersController < ApplicationController


  def create
    @question=Question.find(params[:question_id])
    @answer=Answer.new

    if @answer.update(answer_params)
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end

    if answer.save
      redirect_to question_path
    else
      render :new
    end
  end

  def edit
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
