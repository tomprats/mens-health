class UsersController < ApplicationController
  def new
    @user = User.new
    render "pages/home"
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:current_user_id] = user.id
      redirect_to home_path
    else
      @user = user
      render "pages/home", warning: user.errors.full_messages.join(", ")
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email,
      :password, :password_confirmation
    )
  end
end
