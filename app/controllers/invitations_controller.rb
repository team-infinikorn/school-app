class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :reject]
  before_action :check_expired_invitation, only: [:accept, :reject]

  def accept
    redirect_to new_student_path(token: @invitation.unique_key), notice: 'Invitation has been accepted.' if @invitation.accept!
  rescue StandardError => e
    redirect_to root_url, alert: 'Invitation has been expired'
  end

  def reject
    redirect_to root_url, notice: 'Invitation has been rejected.' if @invitation.reject!
  rescue StandardError => e
    redirect_to root_url, alert: 'Invitation has been expired'
  end

  private

  def set_invitation
    @invitation = Invitation.find_by(unique_key: params[:unique_key])
  end

  def check_expired_invitation
    return if @invitation.expired_at.blank?

    return redirect_to root_url, alert: 'Your invitation has been expired.'
  end
end