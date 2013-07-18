class AddFailedToLibraries < ActiveRecord::Migration
	def change
		change_table :libraries do |t|
			t.boolean :failed
			t.string :comment_why
		end
	end
end
