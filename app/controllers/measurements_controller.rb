class MeasurementsController < ApplicationController
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @measurements = Measurement.all
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
    @measurement.save
    respond_with(@measurement)
  end

  def update
    @measurement.update(measurement_params)
    respond_with(@measurement)
  end

  def destroy
    @measurement.destroy
    respond_with(@measurement)
  end

  private
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def measurement_params
      params.require(:measurement).permit(:type_id, :user_id, :datetime, :value)
    end
end
