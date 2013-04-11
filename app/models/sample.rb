class Sample < ActiveRecord::Base
  attr_accessible :name, :quantity, :size, :project_id

  belongs_to :project

  has_many :libraries

  validates :project_id, presence: true
  validates :name, presence: true
  validates :size, presence: true
  validates :quantity, presence: true

end
