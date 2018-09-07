class AddShortContentToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles,:short_content,:string
  end
end
