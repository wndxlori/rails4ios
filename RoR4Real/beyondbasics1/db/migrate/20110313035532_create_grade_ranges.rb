class CreateGradeRanges < ActiveRecord::Migration
  def self.up
    create_table :grade_ranges do |t|
      t.string :name
      t.integer :from_grade
      t.integer :to_grade

      t.timestamps
    end
  end

  def self.down
    drop_table :grade_ranges
  end
end
