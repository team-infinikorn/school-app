class CreateStudent
  include Interactor

  delegate :params, to: :context

  def call
    Student.transaction do
      courses = []
      @student = Student.new(student_params)
      @student.save!

      params[:student][:courses].each do |course|
        courses << {student_id: @student.id, course_id: course}
      end

      StudentCourse.create!(courses)
    end

  rescue StandardError => exception
    context.student = @student
    context.fail!(error: exception)
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone_no, :emergency_contact, :dob, :address)
  end
end