class AnswersController < ApplicationController


  def create
    @question=Question.find(params[:question_id])
    @answer=Answer.new

    if @answer.update(answer_params)
      flash[:success]="質問に返信しました。"
      redirect_to question_path(@question)
    else
      flash.now[:danger]="質問返信に失敗しました。"
      redirect_to question_path(@question)
    end
  end

  def edit
    @question=Question.find(params[:question_id])
    @answer=@question.answers.find(params[:id])
  end

  private

    def answer_params
      params.require(:answer).permit(:content, :question_id)
    end
end
