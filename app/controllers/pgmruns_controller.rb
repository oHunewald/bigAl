class PgmrunsController < ApplicationController
  def index
  	@pgmruns = Pgmrun.all
  	@pgmruns_by_date = @pgmruns.group_by(&:run_date)
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def new
  	@pgmrun = Pgmrun.new
  	@template = Template.find(params[:template_ids]).first

  end

  def edit
    @pgmrun = Pgmrun.find(params[:id])
  end

  def update
    @pgmrun = Pgmrun.find(params[:id])

    add_to_stock(@pgmrun.inventories)

    if params[:inventories]
      inventories = Inventory.find(params[:inventories])
      @pgmrun.inventories = inventories
    else
      @pgmrun.inventories.destroy_all
    end

    @pgmrun.update_attributes(params[:pgmrun])
    delete_from_stock(params)
    flash[:notice] = "Successfully updated..."
    redirect_to @pgmrun
  end

  def create
  	@pgmrun = Pgmrun.new(params[:pgmrun])
  	@template = Template.find(params[:template_id])
  	@pgmrun.template_id = @template.id
  	@pgmrun.user_id = current_user.id

    if params[:inventories]
      inventories = Inventory.find(params[:inventories])
    end
    if !inventories.blank?
      @pgmrun.inventories = inventories
    end

  	if @pgmrun.save
      delete_from_stock(params)
  		flash[:notice] = "Successfully created..."
  		redirect_to @pgmrun
  	else
  		flash[:alert] = @pgmrun.errors.full_messages.to_sentence
  		render :action => "new"
  	end
  end

  def show

  	@pgmrun = Pgmrun.find(params[:id])
  	@template = @pgmrun.template
  	@user = User.find(@pgmrun.user_id)
  end

  def edit
  	@pgmrun = Pgmrun.find(params[:id])
  	@template = @pgmrun.template
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
end
