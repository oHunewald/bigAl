class Sharedmessage < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :archive

  belongs_to :user

  def self.get_new_messages
  	last_month = Time.now - 30.days
  	#self.find(:all, :conditions => {:created_at <= last_month})
  	@actual_messages = where(["created_at >= ?", last_month])

  end
end
