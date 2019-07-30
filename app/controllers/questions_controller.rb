class QuestionsController < ApplicationController

  def index
    @questions=current_user.questions.all
  end

  def new
    @question=Question.new
  end

  def create
    @question=current_user.questions.new(question_params)

    if @question.save
      flash[:success]="質問を投稿しました。"
      redirect_to new_question_path
    else
      flash.now[:danger]="質問投稿に失敗しました。"
      render :new
    end
  end

  def show
    @question=Question.find(params[:id])
    @answer=Answer.new
  end

  private

    def question_params
      params.require(:question).permit(:title, :content)
    end
end
