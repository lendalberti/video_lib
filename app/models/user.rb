class User < ActiveRecord::Base
  acts_as_decorables

  belongs_to :company

  has_many :badge_users
  has_many :badges, through: :badge_users

  has_many :video_users
  has_many :videos, through: :video_users

  validates_presence_of :name

  def to_s
    name
  end

  def watch_video video
    videos << video
  end

  def watched? video
    videos.include? video
  end


  def iterations(video)
    vu = VideoUser.where( :user_id => self.id, :video_id => video.id )
    if vu.empty?
      0
    else
      vu[0].iterations
    end
  end



end
