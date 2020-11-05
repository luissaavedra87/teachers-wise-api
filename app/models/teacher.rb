# frozen_string_literal: true

class Teacher < ApplicationRecord
  has_many :appointments, dependent: :destroy
end
