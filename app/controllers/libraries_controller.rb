class LibrariesController < ApplicationController
  def index
	#@project = Project.find(params[:project_id])
  #@libraries = @project.samples.find(params[:sample_id]).libraries
	#@libraries = Sample.find(params[:sample_id]).libraries
  @libraries = current_user.libraries.all
  end

  def my_libraries
    @libraries = current_user.libraries.all
    render :action => 'index'
  end

  def new
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])
  	@library = @sample.libraries.build
    @library.lib_number = get_number
    @inventories = Inventory.where(
      :item_description => 'Library prep', :empty => 'f', :user_id => current_user) 
  end

  def show
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])

  	@library = @sample.libraries.build(params[:library])  
    @library.user_id = current_user.id	
    @library.lib_number = get_number

    inventories = Inventory.find(params[:inventories])
    if !inventories.blank?
      @library.inventories = inventories
    end  

  	if @library.save
      # when kits are used update the inventory
      #update_stock(params, 1)

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
    @inventories = Inventory.where(
      :item_description => 'Library prep', :empty => 'f', :user_id => current_user)    
  end

  def update
    puts params
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])

    inventories = Inventory.find(params[:inventories])

    @library.inventories = inventories
    @library.update_attributes(params[:library])
    
    flash[:notice] = "Successfully updated..."
    redirect_to [@project, @sample, @library]
  end

  def destroy
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    Library.find(params[:id]).destroy  
    redirect_to [@project, @sample]
  end

  private
    def update_stock(params, value)

      if !params[:shearing_kit].blank?
        item = Inventory.find(params[:shearing_kit])
        set_values(item, value)
        item.save
      end

      if !params[:fragment_kit].blank?
        item = Inventory.find(params[:fragment_kit])
        set_values(item, value)
        item.save
      end

      if !params[:mid_kit].blank?
        item = Inventory.find(params[:mid_kit])
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

    def get_number()

      datetime = DateTime.current
      
      final_number = 'PGM-Lib-' + datetime.to_s(:number)
    end


end
