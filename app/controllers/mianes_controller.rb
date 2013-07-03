class MianesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_project

	def index
		@mianes = @project.mianes
	end

	def new		
		@miane = @project.mianes.build
	end

	def show
		@miane = @project.mianes.find(params[:id])		
	end

	def create
		@miane = @project.mianes.build(params[:miane])
		@project.state = "wait for approval"
		@project.save
		if @miane.save
			flash[:notice] = "Successfully created..."
			logger.debug "saved"
			redirect_to [@project]
		else
			flash[:alert] = "Creation or update failed!"
			logger.debug "not saved"
			render :action => "new"
		end
	end

	# edit the miane sheet
	# we don't edit the miane sheet, we copy the information
	# and create a new one to keep history
	def edit
		@miane = @project.mianes.find(params[:id])	
	end

	def update
		@project.mianes.build(params[:miane])

		#@project.miane.update_attributes(params[:miane])
		@project.state = "wait for approval"
		@project.save
	
		redirect_to @project
	end

	private
		def find_project
			@project = Project.find(params[:project_id])
		end

end
