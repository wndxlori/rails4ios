class CreateFieldTrips < ActiveRecord::Migration
  def self.up
    create_table :field_trips do |t|
      t.string :name
      t.string :subject_area
      t.date :trip_date
      t.references :grade_range

      t.timestamps
    end
  end

  def self.down
    drop_table :field_trips
  end
end
