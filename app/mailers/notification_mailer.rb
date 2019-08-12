class NotificationMailer < ActionMailer::Base
  default from: "tseniors777@gmail.com"

  def send_confirm_to_user(user)
    @user=user
    mail(
      subject: "ユーザー登録が完了しました。",
      to: @user.email
    ) do |format|
      format.text
    end
  end
end
