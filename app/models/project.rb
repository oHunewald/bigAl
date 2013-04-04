class Project < ActiveRecord::Base
  attr_accessible :name, :state, :miane_id
  belongs_to :user
  has_one :miane
  has_many :samples
  validates :user_id, presence: true
  validates :name, presence: true

  def change_state(state)
  	@state = state
  end

    
  def self.find_not_approved
  	self.find(:all, :conditions => {:state => 'wait for approval'})
  end
  
end
