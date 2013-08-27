class PoolsController < ApplicationController


	def index
		@pools  = Pool.where(:ready => 't', :used => 'false')
		#@inv
	end

	def userpools
		@pools = Pool.where(:user_id => current_user.id)
	end

	def new
		@pool = current_user.pools.build
		@pool.used = false
		@libraries = Library.find(params[:lib_ids])
		pmol_array = Array.new
		@libraries.each do |lib|
			#@pool.lib5ul.build

			# find the lowest concentration in pmol/L
			pmol_array.push(lib.pmol_after)			
		end
		low = pmol_array.min
		#lib_min = Library.find( "pmol_after = #{low}" )
		#lib_min = Library.where(:pmol_after => low).first
		@dilutions = Hash.new
		@libraries.each do |lib|

			if lib.pmol_after == low
				@dilutions[lib.lib_number] = 0.0
			else
				dil = (lib.pmol_after.to_f / low.to_f - 1) * 5
				@dilutions[lib.lib_number] = dil
			end

		end
	end

	# the create method must calculate the dilution of each library based
	# on the lowest pmol value from library
	def create
		@pool = current_user.pools.create
		@pool.date_pooling = params[:pool][:date_pooling]
		@pool.ul_dilution = params[:pool][:ul_dilution]
		date_time = DateTime.current
		@pool.name = @current_user.name + '-pool-' + date_time.to_s(:number)
		@pool.ready = false
		@libraries = Library.find(params[:pool][:lib_ids])
		#@pool.libraries = @libraries
		dilutions = params[:pool][:dilutions]
		d_hash = Hash.new
		dilutions = dilutions.split(",")
		x = dilutions.length / 2
		n = 0
		x.times do |i|
			key = dilutions.shift
			value = dilutions.shift
			lib = Library.where(:lib_number => key).first
			lib5ul = Lib5ul.new
			lib5ul.value = value.to_f
			lib5ul.library_id = lib.id
			@pool.lib5uls << lib5ul
			@pool.libraries << lib
		end

		if @pool.save
			flash[:notice] = "Successfully created..."

			redirect_to @pool
		end		
	end

	def show
		@pool = Pool.find(params[:id])
		@lib5uls = Lib5ul.where(:pool_id => @pool.id)
		@seqfile = Seqfile.new
		@seqfiles = @pool.seqfiles
	end

	def edit
		@pool = Pool.find(params[:id])
		@lib5uls = Lib5ul.where(:pool_id => @pool.id)
		@libraries = @pool.libraries
	end

	def update
		@pool = Pool.find(params[:id])
		@lib5uls = Lib5ul.where(:pool_id => @pool.id)
		@libraries = @pool.libraries
		
		if @pool.bioanalyser_qbit.blank?
			@pool.ready = true
		end
		@pool.update_attributes(params[:pool])

		redirect_to @pool

	end
end
