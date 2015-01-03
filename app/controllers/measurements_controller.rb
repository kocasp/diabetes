class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  respond_to :html

  def index
    #TODO find another way to parse date from date_select ?
    date = params[:date]
    if date.present?
      @selected_day = Date.new(date['date(1i)'].to_i,date['date(2i)'].to_i,date['date(3i)'].to_i)
    else
      @selected_day = DateTime.current
    end
    @measurements = Measurement.where(datetime: @selected_day.beginning_of_day..@selected_day.end_of_day)
    respond_with(@measurements)
  end

  def show
    respond_with(@measurement)
  end

  def new
    @measurement = Measurement.new
    respond_with(@measurement)
  end

  def edit
  end

  def create
    @measurement = Measurement.new(measurement_params)
    @measurement.user = current_user
    @measurement.save
    #respond_with(@measurement)
    redirect_to show_profile_path
  end

  def update
    @measurement.update(measurement_params)
    respond_with(@measurement)
  end

  def destroy
    @measurement.destroy
    #respond_with(@measurement)
    redirect_to show_profile_path
  end

  private
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:measurement_type_id, :datetime, :value)
    end
end
