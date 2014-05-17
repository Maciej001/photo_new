class Album < ActiveRecord::Base
	include Attachable
end

# Image belongs to Album via Attachable
# Album can have many photographs

