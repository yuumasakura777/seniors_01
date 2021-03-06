class FavoritesController < ApplicationController

  before_action :set_post, only:[:create, :destroy]

  def index
    @favorite_posts=current_user.favorite_posts.recent.page(params[:page]).per(20)
  end

  def create
    favorite=current_user.favorites.build(post_id: params[:post_id])

    if favorite.save
      #flash[:success]="お気に入りに登録しました。"
      #redirect_to posts_path
    end
  end

  def destroy
    Favorite.find_by(post_id: params[:post_id], user_id: current_user.id).destroy
    #redirect_to posts_path
  end

  private

    def set_post
      @post=Post.find(params[:post_id])
    end

end
