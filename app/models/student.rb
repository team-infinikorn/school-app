class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates :first_name, :last_name, :dob, :phone_number, :emergency_phone_number, :address, presence: true
  validates :phone_number, :emergency_phone_number,
    format: { with: /(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}/ }
end
