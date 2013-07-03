class AddRefDocumentToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :ref_document, :string
  end
end
