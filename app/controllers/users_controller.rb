class UsersController < ApplicationController
#before_action :find_user, exept: [:index, :new, :create]
before_action :logged_in?, only: [ :show ]

  def new
  	@user = User.new
  end

  def create
  	user = User.create(user_params)
    if user.save
      login user
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
  end

  def show
  end

  def destroy 
    log_out
    redirect_to root_url
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
