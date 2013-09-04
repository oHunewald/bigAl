class TemplatesController < ApplicationController

	def index
		
		# show the not used templates for selection
		# of PGM run
		@templates = Template.where(:used => 'false')
	end

	def usertemplates
		@templates = Template.where(:user_id => current_user.id)
	end


	def new
		
		@template = Template.new
		@pool = Pool.find(params[:pool_ids]).first
		@inventories = Inventory.where(:item_description => 'Template prep', :empty => 'f')

	end

	def show
		@template = Template.find(params[:id])
		@user = User.find(@template.user_id)
		#@responsible = User.find(@template.responsible_id)
		#@libraries = @user.libraries.all
	end

	def edit
		@template = Template.find(params[:id])
		@pool = Pool.find(@template.pool_id)
		#@users = User.all
		#@user = User.find(@template.user_id)
		#@updated_library = Library.all
		#@libraries = @template.libraries
	end

	def update
		@template = Template.find(params[:id])

		add_to_stock(@template.inventories)

	    if !params[:inventories].blank?
	      inventories = Inventory.find(params[:inventories])
	      @template.inventories = inventories
	    else
	      @template.inventories.destroy_all
	    end

		@template.update_attributes(params[:template])

		delete_from_stock(params)
		
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
		puts '****************************33'
		puts 'template params'
		puts params
		puts '*******************************'
		
		@template = Template.new(params[:template])
		@pool = Pool.find(params[:template][:pool_id])
		@template.pool = @pool
		@template.used = false
		

		#@template.user_id = current_user.id
		current_user.templates << @template
		
	    inventories = Inventory.find(params[:inventories])
	    if !inventories.blank?
	      @template.inventories = inventories
	    end  

		if @template.save		
			delete_from_stock(params)
			@pool.used = true
			@pool.save				
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

  private
    def delete_from_stock(params)

      if !params[:inventories].blank?
        params[:inventories].each do |i|

          item = Inventory.find(i)

          item.update_stock(1)
        end
      end
    end

    def add_to_stock(inventories)
      inventories.each do |l|

        l.update_stock(-1)
      end      
    end	

end
