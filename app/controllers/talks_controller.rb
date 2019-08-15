class TalksController < ApplicationController

  def index
    @talk = Talk.new
    @talk.f_wer = params[:id]
    @talks = Talk.where(f_wing: current_user).where(f_wer: params[:id])
              .or(Talk.where(f_wer: current_user).where(f_wing: params[:id]))
              .order(id: "DESC").page(params[:page]).per(20)
  end

  def new
    @talk = Talk.new
    @talk.f_wer = params[:id]
    @talk.f_wing = current_user.id
  end

  def create
    @talk=current_user.talks.new(talk_params)

    if @talk.save
      flash[:success]="投稿しました。"
      redirect_to talks_path(id: talk_params[:f_wer])
    else
      flash.now[:danger]="失敗しました。"
      #render :new
      redirect_to talks_path(id: talk_params[:f_wer])
    end
    #binding.pry
  end

  private

    def talk_params
      params.require(:talk).permit(:content, :f_wer, :f_wing)
    end
end
