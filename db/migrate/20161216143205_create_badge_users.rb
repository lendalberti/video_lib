class CreateBadgeUsers < ActiveRecord::Migration
  def change
    create_table :badge_users do |t|
    	t.integer		:badge_id, index: true
    	t.integer		:user_id, index: true

      t.timestamps
    end
    add_foreign_key :badge_users, :users,   on_delete: :cascade
    add_foreign_key :badge_users, :badges,   on_delete: :cascade

  end
end
