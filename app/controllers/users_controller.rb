class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    @select_residence=User.select_residence
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)

    if @user.save
      flash[:success]="ユーザー登録が完了しました。"
      NotificationMailer.send_confirm_to_user(@user).deliver
      redirect_to root_path
    else
      flash.now[:danger]="ユーザー登録に失敗しました。"
      render :new
    end
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])

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



  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age,
      :gender, :residence_id, :description, :image)
    end
end
