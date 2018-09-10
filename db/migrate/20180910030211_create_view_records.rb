class CreateViewRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :view_records do |t|
      t.string :subject_type
      t.integer :subject_id
      t.datetime :create_time
      t.string :real_ip

      t.timestamps
    end
  end
end
