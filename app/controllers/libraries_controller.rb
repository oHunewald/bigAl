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
    #@inventories = Inventory.where(:category => 'Library prep', :empty => 'f', :user_id => current_user)  	
    cat1 = Category.where(:name => 'Ion Shear Plus Reagents Kit').first
    cat2 = Category.where(:name => 'Ion Plus Fragment Library Kit').first
    cat3 = Category.where(:name => 'Ion Xpress Barcode Adapters MID1-16').first
    cat4 = Category.where(:name => 'Ion Xpress Barcode Adapters MID17-32').first
    cat5 = Category.where(:name => 'Ion Xpress Barcode Adapters MID33-48').first
    
    @shearing_kits = Inventory.where(:category_id => cat1.id,
                                    :empty => 'f', 
                                    :user_id => current_user.id)

    @fragment_kits = Inventory.where(:category_id => cat2.id,
                                    :empty => 'f', 
                                    :user_id => current_user.id)

    @mid_kits_1_16 = Inventory.where(:category_id => cat3.id,
                                    :empty => 'f',
                                    :user_id => current_user.id)

    @mid_kits_17_32 = Inventory.where(:category_id => cat4.id,
                                    :empty => 'f',
                                    :user_id => current_user.id)

    @mid_kits_33_48 = Inventory.where(:category_id => cat5.id,
                                    :empty => 'f',
                                    :user_id => current_user.id)

  end

  def show
    @project = Project.find(params[:project_id])
    @sample =  @project.samples.find(params[:sample_id])
    @library = Library.find(params[:id])
    #@library.shearing_kit = params[:shearing_kit]
    #@library.fragment_kit = params[:fragment_kit]
    #@library = @sample.find(params[:id])
  end

  def create
  	@project = Project.find(params[:project_id])
  	@sample = @project.samples.find(params[:sample_id])

  	@library = @sample.libraries.build(params[:library])  
    @library.user_id = current_user.id	
    @library.lib_number = get_number
    # load inventory items
    @library.shearing_kit = params[:shearing_kit]
    @library.fragment_kit = params[:fragment_kit]
    @library.mid_kit = params[:mid_kit]


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
