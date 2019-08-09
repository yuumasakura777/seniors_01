class TalksController < ApplicationController

  def index
    @talks=Talk.where(f_wing: current_user).where(f_wer: params[:id])
  end

  def new
    @talk=Talk.new
    @talk.f_wer=params[:id]
    @talk.f_wing=current_user.id
  end

  def create
    @talk=current_user.talks.new(talk_params)

    if @talk.save
      flash[:success]="投稿しました。"
      redirect_to talks_path(f_wer: talk_params)
    else
      flash.now[:danger]="失敗しました。"
      render :new
    end
    #binding.pry
  end

  private

    def talk_params
      params.require(:talk).permit(:content, :f_wer, :f_wing)
    end




end
