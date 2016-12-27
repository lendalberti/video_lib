class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string  :name,           null: false
      t.string  :badge_name,     null: false
      t.string  :video_name,     null: false
      t.integer :view_count,     null: false

      t.timestamps
    end
  end
end
