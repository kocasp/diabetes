class FixMeasurementTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :measurements, :type_id, :measurement_type_id
  end
end
