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
      delete_from_stock(params)

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

    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    # when updating release the former selected stock
    # its has to be selected again
    add_to_stock(@library.inventories)

    if !params[:inventories].blank?
      inventories = Inventory.find(params[:inventories])
      @library.inventories = inventories
    else
      @library.inventories.destroy_all
    end
        
    @library.update_attributes(params[:library])

    delete_from_stock(params)
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
    def delete_from_stock(params)

      if !params[:inventories].blank?
        params[:inventories].each do |i|
          item = Inventory.find(i)
          puts '********************************'
          puts 'now deleting from stock'
          puts item.lot_number
          item.update_stock(1)
        end
      end
    end

    def add_to_stock(inventories)
      inventories.each do |l|
        puts '********************************'
        puts 'now adding to stock'
        puts l.lot_number
        l.update_stock(-1)
      end      
    end

    def get_number()

      datetime = DateTime.current
      
      final_number = 'PGM-Lib-' + datetime.to_s(:number)
    end


end
