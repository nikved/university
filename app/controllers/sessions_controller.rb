class SessionsController < ApplicationController

  skip_before_filter :require_login

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :success => "Logged in!"
    else
      flash.now[:error] = "Email or password was invalid"
      render 'home/index'
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out!"
  end

end
