class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]
  before_action :check_expired_invitation, only: [:accept, :reject]

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.find_or_initialize_by(email: params[:invitation][:email])

    if @invitation.save
      StudentsMailer.invite_student(@invitation).deliver_now
      redirect_to students_path, notice: 'Invitation has been sent successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    redirect_to new_student_path(token: @invitation.unique_key), notice: 'Invitation has been accepted.' if @invitation.accepted!
  end

  def reject
    redirect_to students_path, notice: 'Invitation has been rejected.' if @invitation.rejected!
  end

  private

  def set_invitation
    @invitation = Invitation.find_by(unique_key: params[:unique_key])
  end

  def check_expired_invitation
    return redirect_to students_path, alert: 'You already accepted the invitation.' if @invitation.expired_at.present?
  end
end