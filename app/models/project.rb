class Project < ActiveRecord::Base
  attr_accessible :name, :state, :miane_id
  belongs_to :user
  has_one :miane
  validates :user_id, presence: true

  def change_state(state)
  	@state = state
  end
    
  
end
