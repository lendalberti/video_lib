class CreateUserVideos < ActiveRecord::Migration
  def change
    create_table :user_videos do |t|
    	t.integer		:video_id, index: true
    	t.integer		:user_id, index: true
    	t.integer		:iterations, default: 0

      t.timestamps
    end
    add_foreign_key :user_videos, :users,   on_delete: :cascade
    add_foreign_key :user_videos, :videos,   on_delete: :cascade
  end
end
