class TalksController < ApplicationController

  def index
    @talk = Talk.new
    @talk.partner_id = params[:id]
    @talks = Talk.talk_matchers(current_user, params[:id]).page(params[:page]).per(20)
  end

  def new
    @talk = Talk.new
    @talk.partner_id = params[:id]
    @talk.myself_id = current_user.id
  end

  def create
    @talk=current_user.talks.new(talk_params)

    if @talk.save
      flash[:success]="投稿しました。"
      redirect_to talks_path(id: talk_params[:partner_id])
    else
      flash.now[:danger]="失敗しました。"
      #render :new
      redirect_to talks_path(id: talk_params[:partner_id])
    end
    #binding.pry
  end

  private

    def talk_params
      params.require(:talk).permit(:content, :myself_id, :partner_id)
    end
end
