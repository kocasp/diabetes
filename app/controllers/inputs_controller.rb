class InputsController < ApplicationController
	before_action :authenticate_user!
	def create
		#TODO make atomic? create and move to model?
		# or maybe just put try and for loop
		# refactor !0 validation
		input = params[:input]
		datetime = Time.new(input['datetime(1i)'],input['datetime(2i)'],input['datetime(3i)'],input['datetime(4i)'],input['datetime(5i)'])
	    sugar = Measurement.new(datetime: datetime, value: input[:sugar].to_f, user: current_user, measurement_type_id: 1)
	    sugar.save if sugar.value != 0
	    insulin = Measurement.new(datetime: datetime, value: input[:insulin].to_f, user: current_user, measurement_type_id: 2)
	    insulin.save if insulin.value != 0
	    food = Measurement.new(datetime: datetime, value: input[:food].to_f, user: current_user, measurement_type_id: 3)
	    food.save if food.value != 0
		redirect_to show_profile_path
	end
end
