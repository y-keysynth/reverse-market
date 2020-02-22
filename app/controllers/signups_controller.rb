class SignupsController < ApplicationController
  # helper_method :current_user
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "アカウント登録が完了しました。"
      @current_user = @user
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end

    # def current_user
    #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    # end

end
