class PasswordsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      # start password flow
      user.set_password_reset
      UserMailer.password_reset(user).deliver

    end

    # render text: "User has been reset"
    redirect_to login_url, notice: "Email was sent with instructions"

  end

  def edit
   code = params[:id]
   @user = User.find_by(code: code)
   puts "THIS IS USER \n \n \n \n \n"
  end

  def update
   code = params[:id]
   @user = User.find_by(code: code)
   if @user.update_attributes params.require(:user).permit(:password, :password_confirmation)
    #invalidate the @user.code to avoid replay
    @user.code = nil
    @user.save
    login(@user)
    redirect_to root_path
   else
    redirect_to "/passwords/#{@user.code}"
   end
  end
end
