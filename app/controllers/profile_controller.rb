class ProfileController < ApplicationController
	before_action :authenticate_user!
	def show
		#TODO find another way to parse date from date_select ?
		date = params[:date]
		if date.present?
		  @selected_day = Date.new(date['date(1i)'].to_i,date['date(2i)'].to_i,date['date(3i)'].to_i)
		else
		  @selected_day = DateTime.current
		end
		#TODO consider changing scope to from3am to 2:59 am
		@measurements = Measurement.where(datetime: @selected_day.beginning_of_day..@selected_day.end_of_day)
		@measurements_by_date = @measurements.group_by(&:datetime)
	end
end
