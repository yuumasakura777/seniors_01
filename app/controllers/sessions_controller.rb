class SessionsController < ApplicationController

  skip_before_action :logged_in_user

  def new
  end

  def create
    user=User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      log_in user
      flash[:success]="ログインに成功しました。"
      redirect_to root_path
    else
      flash.now[:danger]="ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

  private

    def session_params
      params.require(:session).permit(:email, :password)
    end
end
