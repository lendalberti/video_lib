class Rule < ApplicationRecord
	validates_presence_of 	:name,
													:badge_name,    
													:video_name, 
													:view_count

end
