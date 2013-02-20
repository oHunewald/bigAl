class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @projects = current_user.projects.all
  end
end
