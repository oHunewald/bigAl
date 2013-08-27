class SeqfilesController < ApplicationController

	before_filter :find_pool

	def new
		@seqfile = Seqfile.new
	end

	def create
		@seqfile = Seqfile.new(params[:seqfile])

		if @seqfile.save
			@pool.seqfiles << @seqfile
			flash[:notice] = "Successfully created..."
			redirect_to [@pool]
		else
			flash[:alert] = "not created..."
			render :action => "new"
		end		
	end

	def show
		@seqfile = Seqfile.find(params[:id])
	end

	private

		def find_pool
			@pool = Pool.find(params[:pool_id])
		end
end
