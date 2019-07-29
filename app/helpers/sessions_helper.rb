module SessionsHelper

  #ログイン処理
  def log_in(user)
    session[:user_id]=user.id
  end

  #現在のユーザー
  def current_user
    if session[:user_id]
      @current_user ||=User.find_by(id: session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  #ログアウト処理
  def logout
    session.delete(:user_id)
    current_user=nil
  end

  #現在のユーザーでログインしているか真偽値で返す
  def logged_in?
    !current_user.nil?
  end
end
