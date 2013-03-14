class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if current_user.role == 'Admin'
      @users = User.all  
    else
      redirect_to root_path
    end
    
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    flash[:notice] = "User has been updated."
    redirect_to @user
  end  
end
