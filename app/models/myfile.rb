class Myfile < ActiveRecord::Base
  attr_accessible :category, :name, :path, :project_id, :tagfield, :attachment

  validates_uniqueness_of :attachment_file_name
  validates :category, presence: true
  validates :attachment, presence: true

  has_and_belongs_to_many :tags
  belongs_to :project

  has_attached_file :attachment, :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
end
