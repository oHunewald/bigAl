class Pool < ActiveRecord::Base
  attr_accessible :template_id, :date_pooling, :tdf, :pmol_l, :user_id,
  				 :bioanalyser_qbit,	:tdf_used, :ul_dilution, :name, :boolean

  has_many :libraries
  has_many :lib5uls

  belongs_to :template
  belongs_to :user
end
