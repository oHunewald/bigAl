class Template < ActiveRecord::Base
  attr_accessible :comment, :qbit_after_es, :qbit_before_es, 
  				  :failed, :user_id, :date_bioanalyser, 
  				  :pool_id, :used, :user_id

	has_one :pool

	belongs_to :user

	has_many :pgmruns
	has_and_belongs_to_many :inventories

	def get_project
		puts '*************************'

		pool = self.pool
		puts pool
		library = pool.libraries.first
		puts '++++++++++++++++++++++++++++++++++++++++++++++'
		puts library

		sample = library.sample
		project = sample.project

		return project.name
	end

	def get_lib_name
		#pool = Pool.where(:id => self.pool_id).first
		pool = Pool.find(self.pool_id)

		library = Library.where(:pool_id => pool.id).first
		return library.lib_number
	end

	def get_pool_name
		return self.pool.name		
	end

	def get_for_user_name
		pool = Pool.where(:id => self.pool_id).first

		library = Library.where(:pool_id => pool.id).first
		return library.user.name
	end	

	def get_lib
		pool = Pool.where(:id => self.pool_id).first

		library = Library.where(:pool_id => pool.id).first		
	end
end
