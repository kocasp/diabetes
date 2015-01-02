class Measurement < ActiveRecord::Base
	belongs_to :user
	belongs_to :measurement_type
	validates_presence_of :measurement_type
end
