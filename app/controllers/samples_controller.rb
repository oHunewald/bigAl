class SamplesController < ApplicationController

	def index
		#@samples = Project.samples.find(params[:project_id])
		@samples = Project.find(params[:project_id]).samples

		# if @samples
		# 	return @samples
		# else
		# 	redirect_to root_path
		# end
		#@samples = Sample.where(:project_id => params[:project_id])
	end

	def new
		@project = Project.find(params[:project_id])
		@sample = @project.samples.build
	end

	def create
		 @project = Project.find(params[:project_id])
		 @sample =  @project.samples.build(params[:sample])

		 if @sample.save
		 	flash[:notice] = "Sample has been created!"
		 	redirect_to [@project]
		 else
		 	flash[:alert] = "Sample has not been created!"
		 	render :action => "new"
		 end
	end

	def show
		@project = Project.find(params[:project_id])
		@sample =  @project.samples.find(params[:id])
	end

	def edit
		@project = Project.find(params[:project_id])
		@sample =  @project.samples.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])
		@sample =  @project.samples.find(params[:id])
		@sample.update_attributes(params[:sample])
		flash[:notice] = "Successfully updated..."
		redirect_to [@project, @sample]
	end
end
