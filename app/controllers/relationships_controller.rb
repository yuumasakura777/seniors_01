class RelationshipsController < ApplicationController

  def create
    follow=current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    flash[:success]="フォローしました。"
    redirect_to users_path
  end

  def destroy
    follow=current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    flash[:success]="フォローを解除しました。"
    redirect_to users_path
  end
end
