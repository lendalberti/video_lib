class Video < ActiveRecord::Base
	acts_as_decorables
	
  has_many :video_users
  has_many :users, through: :video_users

  validates_presence_of :name
end
