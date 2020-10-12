class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :basic_auth, if: :production?
  # 伊藤足し
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # 伊藤足し
  protected
  #伊藤直し last_name birth_day
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day])
  end
end


  def new
    
  end

    
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

