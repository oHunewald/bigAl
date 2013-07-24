class TemplatesController < ApplicationController


	def new
		
		@template = Template.new
		@pool = Pool.find(params[:pool_ids]).first
		@kits = Inventory.where(:item_description => 'Template prep', :empty => 'f')

		puts @kits
		#@updated_library = Library.all
		#@libraries = @template.libraries.build
	end

	def show
		@template = Template.find(params[:id])
		@user = User.find(@template.user_id)
		#@responsible = User.find(@template.responsible_id)
		#@libraries = @user.libraries.all
	end

	def edit
		@template = Template.find(params[:id])
		@users = User.all
		@user = User.find(@template.user_id)
		@updated_library = Library.all
		@libraries = @template.libraries
	end

	def update
		@template = Template.find(params[:id])
		@library = Library.find(params[:second_select])
		@user =User.find(params[:first_select])
		@template.libraries << @library

		#@template.libraries = @libraries
		@template.user_id = params[:first_select]
		@template.responsible_id = current_user.id		
		@template.update_attributes(params[:template])
		flash[:notice] = "Successfully updated..."
		redirect_to @template
	end

	def validate_template
		@template = Template.find(params[:id])
		@template.failed = false
		@template.save

		redirect_to @template
	end

	def create
		
		@template = Template.new(params[:template])

		@pool = Pool.find(params[:template][:pool_id])

		@template.user_id = current_user.id
		inventories = params[:inventories]

		inventories.each do |i|
			inv = Inventory.find(i)
			puts inv
			if !inv.blank?
				@template.inventories << inv
			end
		end

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
