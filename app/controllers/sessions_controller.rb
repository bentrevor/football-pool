class SessionsController < ApplicationController
  def new
  end

  def create
    session[:current_user_name] = params[:login_name]
    flash.now[:success] = 'logged in!'
    render 'new'
  end

  def destroy
    session[:current_user_name] = nil
    render 'new'
  end
end
