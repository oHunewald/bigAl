class Inventory < ActiveRecord::Base
  attr_accessible :item_description, :lot_number, :reaction_kit, :reactions_used,
  					:best_till, :opened, :comment, :empty
end