class Event < ActiveRecord::Base
  has_many :enrollments
end
