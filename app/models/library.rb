class Library < ActiveRecord::Base
  attr_accessible :lib_date, :ul_used, :target_size, :quantity,
  				:mid, :shearing_min, :end_repair_done, :number_of_bands_in_eGel, 
  				:cycles_of_amplification, :date_bioanalyser, :pmol_before,
  				:pmol_after, :comment, :lib_number, :shearing_kit, :fragment_kit,
  				:e_gel,
  				:sample_id, :user_id, :pool_id

	belongs_to :sample
	belongs_to :pool
	belongs_to :user

end
