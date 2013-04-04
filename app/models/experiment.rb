class Experiment < ActiveRecord::Base
  attr_accessible :ex_id
  belongs_to :project

  validates :project_id, presence: true
end
