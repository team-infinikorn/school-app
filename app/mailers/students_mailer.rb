class StudentsMailer < ApplicationMailer
  def invite_student(invitation)
    @invitation = invitation
    mail(to: @invitation.email, subject: "Invite!")
  end
end