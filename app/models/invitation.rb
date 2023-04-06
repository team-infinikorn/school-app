class Invitation < ApplicationRecord
  STATUSES = {
    accepted: 'accepted',
    rejected: 'rejected'
  }
  enum :status, STATUSES

  validates :email, presence: true, format: { with: Devise.email_regexp }
  validates :unique_key, presence: true

  before_validation :set_unique_key

  def accept!
    self.expired_at = Time.zone.now
    accepted!
  end

  def reject!
    self.expired_at = Time.zone.now
    rejected!
  end

  private

  def set_unique_key
    unique_key = nil
    loop do
      unique_key = SecureRandom.base64(12)
      break unique_key unless Invitation.find_by(unique_key:)
    end

    self.unique_key = unique_key
  end
end
