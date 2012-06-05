class Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :field_trip
  
  validates_associated :student
  validates_associated :field_trip
end
