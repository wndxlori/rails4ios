class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :field_trip
  
  validates_associated :student
  validates_associated :field_trip
  
  comma do
    student :name => "Student"
    student 'School' do |student| student.school.name end
  end
end
