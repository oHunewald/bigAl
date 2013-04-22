class Message < ActiveRecord::Base
  attr_accessible :context, :sender_id, :title, :user_id

  belongs_to :user
end
