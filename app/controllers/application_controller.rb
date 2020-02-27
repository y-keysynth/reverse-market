class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :basic_auth, if: :production? 
  protect_from_forgery with: :exception

def set_search
  @search = Item.ransack(params[:q])
  @items = @search.result.order(created_at: "DESC").page(params[:page])
end

  # このアクションを追加
  def after_sign_in_path_for(resource)
    # "/user/#{current_user.id}"
    root_path
  end

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected
  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :dc, :server, :url])
  end
end
