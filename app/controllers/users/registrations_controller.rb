# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # helper_method :current_user
  # プロフィール画面用のアクションを追加
  # def detail
  #   @user = User.find_by(id: params[:id])
  # end

  def new
    @user = User.new
    $one_time_ra_password = SecureRandom.alphanumeric()
    # $one_time_ra_password = "123456789"
  end

  def create
    @user = User.new(user_params)
    check = Scraping.lodestone_url(@user.url)
    # if @user.url == ""
    #   @user.save
    #   render "new"
    # elsif
    #   check = Scraping.lodestone_url(@user.url)
    #   @user = User.new(
    #     email: @user.email,
    #     password: @user.password,
    #     url: check[0],
    #     name: check[2],
    #     server: check[3],
    #     dc: check[4],
    #   )
    #   if @user.save && (@user.password  == @user.password_confirmation) && ($one_time_ra_password == check[1])
    #     # if @user.save
    #     flash[:notice] = "アカウント登録が完了しました。"
    #     session[:id] = @user.id
    #     sign_in User.find(session[:id]) unless user_signed_in?
    #     redirect_to root_path
    #     # else
    #     #   render "new"
    #     # end
    #   else
    #     # @user.save
    #     # binding.pry
    #     # @user.save
    #     render "new"
    #   end
    # end
  end

  private
  def user_params
    params.require(:user).permit(:url, :email, :password, :password_confirmation)
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
