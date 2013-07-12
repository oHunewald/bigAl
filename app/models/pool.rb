class Pool < ActiveRecord::Base
  attr_accessible :template_id, :date_pooling, :tdf, :pmol_l, :user_id

  has_many :libraries
  belongs_to :template
  belongs_to :user
end
