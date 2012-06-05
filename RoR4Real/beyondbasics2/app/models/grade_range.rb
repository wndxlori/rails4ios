class GradeRange < ActiveRecord::Base
  has_many :field_trips
  
  validates_uniqueness_of :name
end
