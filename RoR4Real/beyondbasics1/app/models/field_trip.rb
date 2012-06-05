class FieldTrip < ActiveRecord::Base
  belongs_to :grade_range
  has_many :registrations
  has_many :students, :through => :registrations
  
  #validates date in the future on create?
end
