class Project < ActiveRecord::Base
  attr_accessible :name, :state
  belongs_to :user
  validates :user_id, presence: true
    
  
end
