class Project < ActiveRecord::Base
  attr_accessible :name, :state, :miane_id, :description
  belongs_to :user
  has_many :mianes
  has_many :samples
  has_many :myfiles
  has_many :templates
  validates :user_id, presence: true
  validates :name, presence: true
  validates :description, presence: true

  def change_state(state)
  	@state = state
  end

    
  def self.find_not_approved
  	self.find(:all, :conditions => {:state => 'wait for approval'})
  end
  
end
