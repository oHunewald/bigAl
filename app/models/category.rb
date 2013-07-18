class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :inventories


  def self.get_mid_kits
  	self.where("name like ?",'%Barcode%')
  end  


end
