class TemplatesController < ApplicationController

	def index
		@templates = current_user.templates.all
	end

	def new
		@users = User.all
		@template = Template.new
		@updated_library = Library.all
		@libraries = @template.libraries.build
	end

	def show
		@template = Template.find(params[:id])
		@user = User.find(@template.user_id)
		@responsible = User.find(@template.responsible_id)
		@libraries = @user.libraries.all
	end

	def create
		
		@template = Template.new(params[:template])

		@user =User.find(params[:first_select])
		#@libraries = @user.libraries.all



		# params[:second_select] do |p|
		# 	@library = Library.find(p)
		# 	@template.libraries << @library
		# end

		@library = Library.find(params[:second_select])
		@template.libraries << @library

		#@template.libraries = @libraries
		@template.user_id = params[:first_select]
		@template.responsible_id = current_user.id

		if @template.save
			flash[:notice] = "Successfully created..."
			redirect_to [@template]
		else
			flash[:alert] = "not created..."
			render :action => "new"
		end
	end

	def update_libraries
		#@updated_library = Library.where(user_id => params[:user_id])

		#@data_from_select1 = params[:first_select]

		@selected_user = User.find(params[:first_select])

		#@data_for_select2 = Library.where(user_id => params[:first_select])

		@data_for_select2 = @selected_user.libraries.all
		render :json => @data_for_select2.map{|l| [l.id, l.number]}
	end

end
