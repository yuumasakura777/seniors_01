class TalksController < ApplicationController

  def index
    @talks=Talk.all
  end

  def new
    @talk=Talk.new
  end

  def create
    @talk=Talk.new(talk_params)

    if @talk.save
      flash[:success]="投稿しました。"
      redirect_to talks_path
    else
      flash.now[:danger]="失敗しました。"
      render :new
    end
  end

  private

    def talk_params
      params.require(:talk).permit(:content, :user_id)
    end

end
