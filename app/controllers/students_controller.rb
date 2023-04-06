class StudentsController < ApplicationController
  before_action :set_invitation
  before_action :check_invitation, only: [:new]
  before_action :check_student_email, only: [:create]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to root_path, notice: 'Student has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number, :emergency_phone_number, :dob, :address, course_ids: [])
  end

  def set_invitation
    @invitation = Invitation.find_by(unique_key: params[:token])
  end

  def check_invitation
    return if @invitation.present?

    return redirect_to root_path, alert: 'You are not eligible to submit this application!'
  end

  def check_student_email
    return if @invitation.email == student_params[:email]

    return redirect_to students_path, alert: 'You are not allowed to submit this application! Please contact your admin.'
  end
end