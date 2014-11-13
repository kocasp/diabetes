class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.integer :type_id
      t.integer :user_id
      t.datetime :datetime
      t.string :value

      t.timestamps
    end
  end
end
