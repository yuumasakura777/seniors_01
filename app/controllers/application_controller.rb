class ApplicationController < ActionController::Base

  before_action :logged_in_user


  include SessionsHelper

  private

  #ログイン済みかどうか判定
    def logged_in_user
      unless logged_in?
        flash[:danger]="ログインしてください。"
        redirect_to root_path
      end
    end

  #ログイン済みユーザーが正しいユーザーどうか判定
    def correct_user
      @user=User.find(params[:id])
      redirect_to root_path unless @user==current_user
    end

end
