class Inventory < ActiveRecord::Base
  attr_accessible :item_description, :lot_number, :reaction_kit, :reactions_used,
  					:best_till, :opened, :comment, :empty, :price,
  					:user_id, :category_id


  belongs_to :user
  belongs_to :category




end
