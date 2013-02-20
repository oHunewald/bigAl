class ProjectsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = current_user.projects.build
  end
  
  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:notice] = "Project has been created!"
      redirect_to [@user, @project]
    else
      flash[:alert] = "Project has not been created!"
      render :action => "new"
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    flash[:notice] = "Project has been updated."
    redirect_to @project
  end  
  
  def destroy
    
  end
end