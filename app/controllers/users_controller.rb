class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Thank you for signing up!"
      redirect_to students_path
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :full_name, :password, :password_confirmation)
  end
end