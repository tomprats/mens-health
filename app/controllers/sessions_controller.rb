class SessionsController < ApplicationController
  def new
    @user = User.new
    render "pages/home"
  end

  def create
    email = params[:user][:email].strip.downcase
    user = User.find_by(email: email)
    if user && user.authenticate(params[:user][:password])
      set_current_user(user)
      redirect_to home_path
    else
      @user = User.new(email: email)
      render "pages/home", warning: "Invalid Email/Password combination"
    end
  end

  def destroy
    session.clear
    redirect_to home_path
  end
end
