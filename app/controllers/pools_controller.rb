class PoolsController < ApplicationController

	def new
		@libraries = Library.find(params[:lib_ids])
	end

	def create_pool

		@pool = current_user.pools.build
		@libraries = Library.find(params[:lib_ids])

		params[:lib_ids].each do |id|
			library = Library.find(id)
			puts library.lib_number
		end

		render :action => 'new'
	end

end
