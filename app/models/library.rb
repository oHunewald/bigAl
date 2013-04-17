class Library < ActiveRecord::Base
  attr_accessible :desired_concentration, :exp_size_incl_adaptors, 
  				:mix_1, :mix_2, :number, :pmol, :sample_id, :size_pcr, 
  				:size_with_adaptors, :user_id, :template_id

	belongs_to :sample
	belongs_to :template
	belongs_to :user

end
