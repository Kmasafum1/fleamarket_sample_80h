class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  # def after_sign_in_path_for(resource)
  #   user_path
  #   # サインインした後にユーザーページに飛ぶように設定
  # end
  # def after_sign_up_path_for(resource)
  #   user_path
  #   # サインアップした後にユーザーページに飛ぶように設定
  # end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end
end
