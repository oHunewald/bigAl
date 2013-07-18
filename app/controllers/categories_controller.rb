class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
		
	end

	def create
		@category = Category.new(params[:category])

		if @category.save
			flash[:notice] = "Successfully created..."
			redirect_to @category
		else
			flash[:alert] = "Category has not been created!"
			render :action => "new"
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(params[:category])
		flash[:notice] = "Successfully updated..."
		redirect_to @category
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.inventories.blank?
			@category.destroy
			flash[:notice] = "Category deleted!"
			redirect_to categories_path
		else
			flash[:alert] = "Not deleted!"
			redirect_to @category
		end
	end
end
