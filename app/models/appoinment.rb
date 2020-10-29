class Appoinment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates_uniqueness_of :schedule, :scope => [:user_id, :teacher_id]
end
