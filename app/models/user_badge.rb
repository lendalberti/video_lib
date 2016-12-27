class UserBadge < ActiveRecord::Base
  belongs_to :badge
  belongs_to :user

  validates_presence_of :user_id, :badge_id

end
