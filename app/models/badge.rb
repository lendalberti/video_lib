class Badge < ActiveRecord::Base
  has_many :user_badges
  has_many :users, through: :user_badges

  validates_presence_of 	:name,
  												:fa_symbol
  
end
