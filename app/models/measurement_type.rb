class MeasurementType < ActiveRecord::Base
	has_many :measurements
	validates_presence_of :name
end
