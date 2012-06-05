class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :board
      t.string :category
      t.string :school_type
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :grade_range
      t.boolean :has_ecs, :default => false

      t.timestamps
    end
  end
end
