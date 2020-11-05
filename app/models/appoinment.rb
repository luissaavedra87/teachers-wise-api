# frozen_string_literal: true

class Appoinment < ApplicationRecord
  belongs_to :user
  belongs_to :teacher

  validates_uniqueness_of :schedule, scope: %i[user_id teacher_id]
end
