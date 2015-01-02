class MeasurementTypesController < ApplicationController
  before_action :set_measurement_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @measurement_types = MeasurementType.all
    respond_with(@measurement_types)
  end

  def show
    respond_with(@measurement_type)
  end

  def new
    @measurement_type = MeasurementType.new
    respond_with(@measurement_type)
  end

  def edit
  end

  def create
    @measurement_type = MeasurementType.new(measurement_type_params)
    @measurement_type.save
    respond_with(@measurement_type)
  end

  def update
    @measurement_type.update(measurement_type_params)
    respond_with(@measurement_type)
  end

  def destroy
    @measurement_type.destroy
    respond_with(@measurement_type)
  end

  private
    def set_measurement_type
      @measurement_type = MeasurementType.find(params[:id])
    end

    def measurement_type_params
      params.require(:measurement_type).permit(:name)
    end
end
