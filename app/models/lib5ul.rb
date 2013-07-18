class Lib5ul < ActiveRecord::Base
  attr_accessible :value, :library_id, :pool_id

  belongs_to :library
end
