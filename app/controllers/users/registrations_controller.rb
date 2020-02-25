# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  helper_method :current_user
  # プロフィール画面用のアクションを追加
  # def detail
  #   @user = User.find_by(id: params[:id])
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウント登録が完了しました。"
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # protected

  # ここのコメントアウトを外してリダイレクト先を指定
  # ルートパス名でも良い
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    # "/user/#{current_user.id}"
    root_path
  end
end
