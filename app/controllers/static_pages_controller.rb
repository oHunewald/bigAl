class StaticPagesController < ApplicationController
  
  def news
  	@sharedmessages = Sharedmessage.all

  	#@user = User.find(params[:id])
    @projects = current_user.projects
  end
  
  def home
    @users = User.all
  end

  def help
  end
  
  def about
    
  end
end
