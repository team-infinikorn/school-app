module Admin
  class StudentsController < AdminController
    before_action :set_student, only: [:show]

    def index
      @students = Student.ordered
      @student_invitations = Invitation.ordered
    end

    def show; end

    private

    def set_student
      @student = Student.find(params[:id])
    end
  end
end