class Student < ActiveRecord::Base
  belongs_to :school
  
  comma do
    self.name
    school :name => 'School'
  end
end
