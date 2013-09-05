class InventoriesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@inventories = Inventory.all		
	end

	def new
		@inventory = Inventory.new
	end

	def show
		@inventory = Inventory.find(params[:id])
	end

	def create
		@inventory = Inventory.new(params[:inventory])

		if @inventory.reactions_used.blank?
			@inventory.reactions_used = 0
		end
		
		if @inventory.save
			flash[:notice] = "Successfully created..."
			redirect_to [@inventory]
		else
			flash[:alert] = "creation failed..."
			render :action => "new"
		end
	end

	def edit
		@inventory = Inventory.find(params[:id])
	end

	def update
		@inventory = Inventory.find(params[:id])
		@inventory.update_attributes(params[:inventory])
		flash[:notice] = "Successfully updated..."

		redirect_to @inventory
	end

	def my_inventories
		@inventories = current_user.inventories.all
		render :action => 'index'
	end

end
