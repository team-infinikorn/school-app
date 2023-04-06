class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates :first_name, :last_name, :dob, :phone_number, :emergency_phone_number, :address, presence: true
  validates_format_of :phone_number, :emergency_phone_number, with:  /(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}/
end