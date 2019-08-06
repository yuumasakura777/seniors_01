class PostsController < ApplicationController
  def index
    @posts=Post.recent.page(params[:page]).per(20)
  end

  def new
    @post=Post.new
  end

  def create
    @post=current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  private
    def post_params
      params.require(:post).permit(:content)
    end
end
