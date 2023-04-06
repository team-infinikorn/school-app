class InvitationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_invitation, only: [:accept, :reject]
  before_action :check_expired_invitation, only: [:accept, :reject]

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.find_or_initialize_by(email: invitation_params[:email])

    if @invitation.save
      StudentsMailer.invite_student(@invitation).deliver_now
      redirect_to students_path, notice: 'Invitation has been sent successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    redirect_to new_student_path(token: @invitation.unique_key), notice: 'Invitation has been accepted.' if @invitation.accepted!

  rescue Exception => e
    Rails.logger.info "Exception raised while updating the status #{@invitation.id} ... #{e.message}"
    flash[:alert] = e.message
  end

  def reject
    redirect_to students_path, notice: 'Invitation has been rejected.' if @invitation.rejected!

  rescue Exception => e
    Rails.logger.info "Exception raised while updating the status #{@invitation.id} ... #{e.message}"
    flash[:alert] = e.message
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def set_invitation
    @invitation = Invitation.find_by(unique_key: params[:unique_key])
  end

  def check_expired_invitation
    return redirect_to students_path, alert: 'Your email has been expired.' if @invitation.expired_at.present?
  end
end