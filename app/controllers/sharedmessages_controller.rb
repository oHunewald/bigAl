class SharedmessagesController < ApplicationController
  
  def index

  	@sharedmessages = Sharedmessage.all
  end

  def show
  	@sharedmessage = Sharedmessage.find(params[:id])
  end

  def new
  	@sharedmessage = current_user.sharedmessages.build
  end

  def create
  	@sharedmessage = current_user.sharedmessages.build(params[:sharedmessage])

  	if @sharedmessage.save
  		flash[:notice] = "Successfully created..."
  		redirect_to [@user, @sharedmessage]
  	else
  		flash[:alert] = "not created..."
  		render :action => "new"
  	end

  end
end
