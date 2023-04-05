class Student < ApplicationRecord
  has_many :student_courses
  has_many :courses, through: :student_courses

  validates :first_name, :last_name, :dob, :phone_no, :address, presence: true
end