module StudentsHelper
  def student_selected_courses(student)
    Course.where(id: student.student_courses.pluck(:course_id)).map{ |course| course.name.titleize }.join(', ')
  end
end