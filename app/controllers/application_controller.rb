class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit,:destroy]
  #authenticate_user!:ログインしていなければログイン画面に遷移する
  #only or except を使用し特定のアクションのみ指定することが可能

  before_action :configure_permitted_parameters, if: :devise_controller?

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position ])
  end
end
