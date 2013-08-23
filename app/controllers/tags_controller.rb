class TagsController < ApplicationController
  def index
  end

  def create
  end

  def update
  end

  def delete
  end

  def show
    # @myfiles = Myfile.where()

    # @inventories = Inventory.where(
    #   :item_description => 'Template prep', :empty => 'f')

    # pages = Page.joins(
    #   "join pages_paragraphs on pages.id = pages_paragraphs.page_id").where(
    #   ["pages_paragraphs.paragraph_id = ?", paragraph_id])
  

  @myfiles = Myfile.joins(
    "join myfiles_tags on myfiles.id = myfiles_tags.myfile_id").where(
    ["myfiles_tags.tag_id = ?", params[:id]])

  end
end
