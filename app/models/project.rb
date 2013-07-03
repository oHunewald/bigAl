class Project < ActiveRecord::Base
  attr_accessible :name, :state, :miane_id, :ref_document
  belongs_to :user
  has_many :mianes
  has_many :samples
  validates :user_id, presence: true
  validates :name, presence: true
  mount_uploader :ref_document, RefDocumentUploader

  def change_state(state)
  	@state = state
  end

    
  def self.find_not_approved
  	self.find(:all, :conditions => {:state => 'wait for approval'})
  end
  
end
