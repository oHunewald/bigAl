class LibrariesController < ApplicationController
  def index
	@project = Project.find(params[:project_id])
  	@libraries = @project.samples.find(params[:sample_id]).libraries
	#@libraries = Sample.find(params[:sample_id]).libraries

  end

  def new
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])
  	@library = @sample.libraries.build  	
  end

  def show
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    #@library = @sample.find(params[:id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])

  	@library = @sample.libraries.build(params[:library])  	

  	if @library.save
  		flash[:notice] = "Successfully created..."
  		redirect_to [@project, @sample]
  	else
  		flash[:alert] = "Library has not been created!"
  		render :action => "new"
  	end
  end

  def edit
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])    
  end

  def update
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    @library.update_attributes(params[:library])
    flash[:notice] = "Successfully updated..."
    redirect_to [@project, @sample, @library]
  end
end
