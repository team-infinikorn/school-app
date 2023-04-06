module Admin
  class InvitationsController < AdminController
    def new
      @invitation = Invitation.new
    end

    def create
      @invitation = Invitation.find_or_initialize_by(email: invitation_params[:email])

      if @invitation.save
        StudentsMailer.invite_student(@invitation).deliver_now
        redirect_to admin_students_path, notice: 'Invitation has been sent successfully.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def invitation_params
      params.require(:invitation).permit(:email)
    end
  end
end