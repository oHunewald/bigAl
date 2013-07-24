class Inventory < ActiveRecord::Base
  attr_accessible :item_description, :lot_number, :reaction_kit, :reactions_used,
  					:best_till, :opened, :comment, :empty, :price,
  					:user_id, :category_id


  belongs_to :user
  belongs_to :category
  has_and_belongs_to_many :templates
  has_and_belongs_to_many :libraries

  def combined_name
    #category = Category.find(self.category_id)
  	self.lot_number + '|' + self.category.name
  end

  def update_stock(value)
    if self.reactions_used >= 0
      self.reactions_used += value
      self.save
    end
  end

end
