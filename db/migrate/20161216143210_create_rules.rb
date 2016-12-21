class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string  :name
      t.string  :badge_name
      t.string  :video_name
      t.integer :view_count

      t.timestamps
    end
  end
end
