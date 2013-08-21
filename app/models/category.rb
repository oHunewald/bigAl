class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :inventories
  validates :name, presence: true

  def self.get_mid_kits
  	self.where("name like ?",'%Barcode%')
  end  


end
