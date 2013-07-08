class LibrariesController < ApplicationController
  def index
	@project = Project.find(params[:project_id])
  #@libraries = @project.samples.find(params[:sample_id]).libraries
	@libraries = Sample.find(params[:sample_id]).libraries
  #@libraries = current_user.libraries.all
  end

  def user_libraries
    @libraries = current_user.libraries.all
  end

  def new
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])
  	@library = @sample.libraries.build
    @inventories = Inventory.where(:category => 'Library prep', :empty => 'f')  	
  end

  def show
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    #@library = @sample.find(params[:id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])

  	@library = @sample.libraries.build(params[:library])  
    @library.user_id = current_user.id	
    @library.shearing_kit = params[:shear_kit]
    @library.fragment_kit = params[:fragment_kit]
    @library.e_gel = params[:e_gel]

  	if @library.save
      # when kits are used update the inventory
      update_stock(params, 1)
  		flash[:notice] = "Successfully created..."
  		redirect_to [@project, @sample]
  	else
  		flash[:alert] = "Library has not been created!"
  		render :action => "new"
  	end
  end

  def edit
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])    
  end

  def update
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    @library.update_attributes(params[:library])
    flash[:notice] = "Successfully updated..."
    redirect_to [@project, @sample, @library]
  end

  private
    def update_stock(params, value)

      if !params[:shear_kit].blank?
        item = Inventory.where(:lot_number => params[:shear_kit]).first
        set_values(item, value)
        item.save
      end

      if !params[:fragment_kit].blank?
        item = Inventory.where(:lot_number => params[:fragment_kit]).first
        set_values(item, value)
        item.save
      end
      
      if !params[:e_gel].blank?
        item = Inventory.where(:lot_number => params[:e_gel]).first
        set_values(item, value)
        item.save
      end

    end

    def set_values(item, value)
        item.reactions_used += value
        if item.reactions_used >= item.reaction_kit
          item.empty = true
        end      
    end

end
