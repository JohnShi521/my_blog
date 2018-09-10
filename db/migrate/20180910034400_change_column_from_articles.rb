class ChangeColumnFromArticles < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles,:view_record_count, :view_records_count
  end
end
