class MianesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_project

	def new		
		@miane = @project.build_miane
	end

	def create
		@miane = @project.build_miane(params[:miane])
		@project.state = "wait for approval"
		@project.save
		if @miane.save
			flash[:notice] = "Successfully created..."
			logger.debug "saved"
			redirect_to [@project]
		else
			flash[:alert] = "Failed..."
			logger.debug "not saved"
			render :action => "new"
		end
	end

	def edit
		@miane = @project.miane	
	end

	def update
		@project.miane.update_attributes(params[:miane])
		@project.state = "wait for approval"
		@project.save
		redirect_to @project
	end

	private
	def find_project
		@project = Project.find(params[:project_id])
	end

end
