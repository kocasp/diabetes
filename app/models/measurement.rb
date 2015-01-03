class Measurement < ActiveRecord::Base
	belongs_to :user
	belongs_to :measurement_type
	validates_presence_of :measurement_type
	validates_presence_of :user
	validates_presence_of :value
end
