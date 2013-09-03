class Pgmrun < ActiveRecord::Base
  attr_accessible :template_id, :run_date, :ot_date, :initialisation,
  				:run_number, :pgm_number, :mean_read_length, :perc_loading,
  				:keysignal, :final_lib_reads, :perc_low_quality, :testfragment,
  				:ts_version, :comment, :user_id

	validates_numericality_of :mean_read_length,
		:only_integer => true,
		:message => 'only enter full numbers !'

	belongs_to :template
	belongs_to :user

	has_and_belongs_to_many :inventories

	def get_template
		@template = Template.where(:id => self.template_id).first
	end

	def get_for_user_name(pgmrun)

		template = Template.where(:id => self.template_id).first
		puts template
		pool = Pool.where(:id => template.pool_id).first

		library = Library.where(:pool_id => pool.id).first
		return library.user.name
	end

	def combined_name
		user = User.find(self.user_id)
		template = Template.find(self.template_id)
		project = template.get_project
		
		combi_name = user.name + '-' + project

		#return combi_name
	end
	
end
