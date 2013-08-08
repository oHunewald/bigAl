class PgmrunsController < ApplicationController
  def index
  	@pgmruns = Pgmrun.all
  	
  end

  def new
  	@pgmrun = Pgmrun.new
  	@template = Template.find(params[:template_ids]).first
  end

  def create
  	@pgmrun = Pgmrun.new(params[:pgmrun])
  	@template = Template.find(params[:template_id])
  	@pgmrun.template_id = @template.id
  	@pgmrun.user_id = current_user.id

  	if @pgmrun.save
  		flash[:notice] = "Successfully created..."
  		redirect_to @pgmrun
  	else
  		flash[:alert] = "not created..."
  		render :action => "new"
  	end
  end

  def show

  	@pgmrun = Pgmrun.find(params[:id])
  	@template = @pgmrun.template
  	@user = User.find(@pgmrun.user_id)
  end

  def edit
  	@pgmrun = Pgmrun.find(params[:id])
  	@template = @pgmrun.template
  end
end
