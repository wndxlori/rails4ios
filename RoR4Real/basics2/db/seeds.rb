require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#
# ROR4REAL
# This is where you parse your CSV file, and stuff it into the database. You've already created the
# migration for your model, and run it, right?
#
file = "#{Rails.root}/db/CALGIS.SCHOOL_LOCATION.csv"
CSV.foreach(file, :headers => true) do |row|
  School.create(
    :board => row[0],
    :category => row[1],
    :school_type => row[2],
    :name => row[3],
    :address => row[4],
    :city => row[5],
    :province => row[6],
    :postal_code => row[7],
    :grade_range => row[8],
    :has_ecs => row[9] == 'Y'
  )
  begin
    GradeRange.create(:name => row[8])
  rescue
  end
end    
