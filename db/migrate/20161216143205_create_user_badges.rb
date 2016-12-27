class CreateUserBadges < ActiveRecord::Migration
  def change
    create_table :user_badges do |t|
    	t.integer		:user_id, index: true, null: false
    	t.integer		:badge_id, index: true, null: false

      t.timestamps
    end
    add_foreign_key :user_badges, :users,   on_delete: :cascade
    add_foreign_key :user_badges, :badges,   on_delete: :cascade

  end
end
