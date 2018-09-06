class AddSourceTypeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :source_type, :integer
  end
end
