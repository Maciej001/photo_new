class Album < ActiveRecord::Base
	validates :name, presence: true

	include Attachable

end



