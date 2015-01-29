 class UsersController < ApplicationController
#before_action :find_user, exept: [:index, :new, :create]
before_action :logged_in?, only: [ :show ]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users}
    end
  end

  def new
  	@user = User.new
  end

  def create
<<<<<<< HEAD
  	@user = User.create(user_params)
    
        if @user.save
  	    redirect_to user_path(@user.id)
    #render a path for if invalid
        else
          render :new
        
  end

=======
  	user = User.create(user_params)
    if user.save
      login user
      redirect_to root_path
    else
      redirect_to sign_up_path
    end
>>>>>>> 66c7b314cb4fa30ee8f4df6eda9b93e98da018ff
  end

  def show
  end

  def destroy 
    log_out
    redirect_to root_url
  end

  private

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :gender, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
