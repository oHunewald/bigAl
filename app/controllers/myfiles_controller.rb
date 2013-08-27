class MyfilesController < ApplicationController

	def new
		@myfile = Myfile.new
		@project = Project.find(params[:project_id])
	end

	def create

		@project = Project.find(params[:project_id])

		end
		@myfile = Myfile.new(params[:myfile])
		
		# when tagging put also the category as tagging field
		
		cat_tag = Tag.where(name: @myfile.category).first
		if cat_tag.blank?
			cat_tag = Tag.new(name: @myfile.category)
			cat_tag.save
		end
		@myfile.tags << cat_tag		

		tags = @myfile.tagfield.split(',')
		tags.each do |t|

			newtag = Tag.where(name: t).first
			
			if newtag.blank?
				newtag = Tag.new(name: t)
				newtag.save
			end
			@myfile.tags << newtag			

		end
		
		if @myfile.save
			@project.myfiles << @myfile
			flash[:notice] = "Successfully created..."
			redirect_to [@project, @myfile]
		else
			flash[:alert] = "not created..."
			render :action => "new"
		end

	end

	def show
		@project = Project.find(params[:project_id])
		@myfile = Myfile.find(params[:id])
	end
end
 