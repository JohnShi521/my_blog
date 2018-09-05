class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :type
      t.string :title
      t.text :content, limit:4294967295
      t.integer :view_record_count, default:0
      t.datetime :create_time
      t.integer :user_id
      t.integer :category_id
      t.integer :status, default:0

      t.timestamps
    end
  end
end
