class LoginController < ApplicationController
  def signin
    user = User.find_by(name: params[:login_name])
    current_user = user || @current_user
  end
end
