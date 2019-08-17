class UsersController < ApplicationController

  skip_before_action :logged_in_user, only:[:index, :new, :create, :user_create, :show]
  before_action :set_user, only:[:show, :edit, :update]

  def index
    #直近の登録順に表示
    @users=User.recent.page(params[:page]).per(20)

    @u=current_user.matchers

    #名前で検索
    if params[:name].present?
      @users=@users.search_by_name params[:name]
    end

    #年齢で検索
    if params[:age].present?
      @users=@users.search_by_age params[:age]
    end

    #性別で検索
    if params[:gender].present?
      @users=@users.search_by_gender params[:gender]
    end

    #居住地で検索
    if params[:residence].present?
      @users=@users.search_by_residence params[:residence]
    end
  end

  def new
    @user=User.new
  end

  def create

    @user=User.new(user_params)

    if @user.save
      log_in @user
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to user_path(@user)
      flash[:success]="ユーザー登録を完了しました。"
    else
      flash.now[:danger]="ユーザー登録に失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success]="ユーザー情報を更新しました。"
      redirect_to user_path
    else
      flash.now[:danger]="ユーザー情報の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    user=User.find(params[:id]).destroy
    flash[:success]="#{user.name}の削除に成功しました。"
    redirect_to users_path
  end

  #フォロー一覧
  def follows
    user=User.find(params[:id])
    @users=user.followings.page(params[:page]).per(20)
  end

  #フォロワー一覧
  def followers
    user=User.find(params[:id])
    @users=user.followers.page(params[:page]).per(20)
  end

  #マッチングしたユーザーの一覧表示
  def matcher_list
    @matchers=current_user.matchers
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age,
      :gender, :residence, :description, :image,)
    end

    def set_user
      @user=User.find(params[:id])
    end
end
