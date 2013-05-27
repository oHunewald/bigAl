class Template < ActiveRecord::Base
  attr_accessible :commit, :ot_kit_used, :pmol_l, :pmol_l_pool, 
  				:pooling, :qbit_after_es, :qbit_before_es, :tdf, 
  				:tdf_pool, :failed,:user_id

	has_many :libraries

	has_many :seq_runs

	validates :libraries, presence: true
end
