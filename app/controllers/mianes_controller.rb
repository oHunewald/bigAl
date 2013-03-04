class MianesController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_project

	def new
		
		@miane = @project.build_miane
	end

	def create

		@miane = @project.build_miane(params[:miane])
		#@miane = @Miane.new(params[:miane])
		#@project.miane = miane
		logger.debug params
		logger.debug "*************************************"
		logger.debug @miane
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

	private
	def find_project
		@project = Project.find(params[:project_id])
	end

end
