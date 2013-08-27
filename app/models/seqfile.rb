class Seqfile < ActiveRecord::Base
  attr_accessible :category, :pool_id, :attachment, :attachment_file_name

  #validates_uniqueness_of :attachment_file_name
  validates :category, presence: true
  validates :attachment, presence: true

  belongs_to :pool

  has_attached_file :attachment
end
