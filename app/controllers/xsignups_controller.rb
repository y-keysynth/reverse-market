class SignupsController < ApplicationController
  # has_secure_password validations: true

  # validates :comment, presence: true
  # validates :url, presence: true
  # validates :mail, presence: true, uniqueness: true

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   hoge = Scraping.lodestone_url
  #   if @user.save
  #     redirect_to login_path
  #   else
  #     render 'new'
  #   end
  # end

  # private

  #   def user_params
  #     params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  #   end

end
