class UsersController < ApplicationController
# before_action calls a given method before
# the given action is executedd

before_action :signed_in_user,  only: [:index, :edit, :update, :destroy]
before_action :correct_user,    only: [:edit, :update]
before_action :admin_user,      only: :destroy
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def show 
  	@user = User.find(params[:id])
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Photo App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end # create action

  def edit 
    # below line omitted cause current_user defines @user
    # @user = User.find(params[:id])
  end

  def update
    # as above
    # @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

 private

    def user_params
      # admin is not on the list! This prevents granting 
      # administrative access to smart users
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # used by before_action filter
    def signed_in_user
      unless signed_in?
        store_location # to be able to redirect user back to the page
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    # correct user is used to check if user1 is not trying to 
    # edit profile of user2
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  
end # UsersController
