class StudentsController < ApplicationController
  before_action :set_student, only: :show
  before_action :set_invitation, only: [:new, :create]
  before_action :check_student_email, only: :create

  def index
    @students = Student.order(created_at: :desc)
    @student_invitations = Invitation.order(created_at: :desc)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      @student.course_ids = params[:course_ids]
      redirect_to students_path, notice: 'Student has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :phone_number, :emergency_phone_number, :dob, :address)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def set_invitation
    @invitation = Invitation.find_by(unique_key: params[:token])
  end

  def check_student_email
    return redirect_to students_path, alert: 'Email does not match with invite email.' unless @invitation.email == student_params[:email]
  end
end