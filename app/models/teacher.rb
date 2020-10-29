class Teacher < ApplicationRecord
  has_many :appointments, dependent: :destroy
end
