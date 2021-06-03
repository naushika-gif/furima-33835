class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramaters, if: :devise_controller?
  before_action :basic_auth

  #新規登録での入力情報をDBヘ保存するためのメソッド。カラム名の全ての追加が必要
  private
  def configure_permitted_paramaters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name_jap, :family_name_jap,:first_name_kana,:family_name_kana,:birthday])
  
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
