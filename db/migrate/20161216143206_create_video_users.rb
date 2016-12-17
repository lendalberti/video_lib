class CreateVideoUsers < ActiveRecord::Migration
  def change
    create_table :video_users do |t|
    	t.integer		:video_id, index: true
    	t.integer		:user_id, index: true
    	t.integer		:iterations 

      t.timestamps
    end
    add_foreign_key :video_users, :users,   on_delete: :cascade
    add_foreign_key :video_users, :videos,   on_delete: :cascade
  end
end
