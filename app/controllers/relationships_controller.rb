class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    follow=current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    flash[:success]="#{@user.name}さんをフォローしました。"
    redirect_to user_path(params[:user_id])
  end

  def destroy

    follow=current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    flash[:success]="#{@user.name}さんのフォローを外しました。"
    redirect_to users_path
  end

  private

    def set_user
      @user=User.find(params[:user_id])
    end

end
