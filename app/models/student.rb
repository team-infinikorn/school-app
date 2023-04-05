class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates :first_name, :last_name, :dob, :phone_no, :emergency_phone_no, :address, presence: true
  validates_format_of :phone_no, :emergency_phone_no, with:  /(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}/
end