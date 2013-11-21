class SessionsController < ApplicationController
  def new
  end

  def create
    user =  User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You logged in!"
      redirect_to root_path
    else
      flash[:error] = "Sorry, try again."
      redirect_to register_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out!"
    redirect_to root_path
  end
end
