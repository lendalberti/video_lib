class Video < ActiveRecord::Base
	acts_as_decorables
	
  has_many :user_videos
  has_many :users, through: :user_videos

  validates_presence_of :name
end
