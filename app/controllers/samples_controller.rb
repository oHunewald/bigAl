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
		 
		 #@number = params[:extraparam.value]

		 # if params[:extraparam] =="amount"
		 # 	logger.debug "it works"
		 # else
		 # 	logger.debug "it doesn't work"

		 # end

		 # if params[:name] == "46464"
		 # 	@number = params[:name].to_i
		 # 	logger.debug "it works with text fields directly"
		 # 	logger.debug @number
		 # else
		 # 	logger.debug "it doesn't work"

		 # end

		 @number = params[:amount].to_i

		 for n in 1..@number do
		 	@sample =  @project.samples.build(params[:sample])
		 	@sample.name = @sample.name + "_" + n.to_s
		 	@sample.save
		 end

		 redirect_to [@project]

		 # if @sample.save
		 # 	flash[:notice] = "Sample has been created!"
		 # 	redirect_to [@project]
		 # else
		 # 	flash[:alert] = "Sample has not been created!"
		 # 	render :action => "new"
		 # end

	end

	def show
		@project = Project.find(params[:project_id])
		@sample =  @project.samples.find(params[:id])
		@libraries = @sample.libraries
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

	def destroy
		@project = Project.find(params[:project_id])
		@project.samples.find(params[:id]).destroy
		redirect_to [@project]

	end
end
