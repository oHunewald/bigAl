class SeqRun < ActiveRecord::Base
  attr_accessible :chip, :kit, :name, :seq_date

  belongs_to :template

end
