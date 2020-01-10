class Enrollment < ActiveRecord::Base
  belongs_to :event
  belongs_to :volunteers, class_name: "User"

  YEAR = %w(F.E. S.E. T.E. B.E. Other)

  validates :receipt_no, presence: true, uniqueness: true
  validates :event_name, presence: true
  
  def dept=(value)
    write_attribute(:dept, value.upcase)
  end
  
  def college=(value)
    write_attribute(:college, value.upcase)
  end
  
  def name=(value)
    write_attribute(:name, value.upcase)
  end
  
  def team=(value)
    write_attribute(:team, value.upcase)
  end

end