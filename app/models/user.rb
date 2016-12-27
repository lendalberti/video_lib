class User < ActiveRecord::Base
  acts_as_decorables

  belongs_to :company

  has_many :user_badges
  has_many :badges, through: :user_badges

  has_many :user_videos
  has_many :videos, through: :user_videos

  validates_presence_of :name, :company_id

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
    uv = UserVideo.where( :user_id => self.id, :video_id => video.id )
    uv.empty? ? 0 : uv[0].iterations
  end

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end



end
