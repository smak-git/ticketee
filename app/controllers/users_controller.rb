class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "You have signed up successfully"
  		redirect_to projects_path
  	else
  		flash[:alert] = "There was an error, please try again"
      render :new
  	end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile has been updated"
      redirect_to @user
    else
      flash[:alert] = "Profile has not been updated"
      render 'edit'
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
