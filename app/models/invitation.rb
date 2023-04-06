class Invitation < ApplicationRecord
  STATUSES = {accepted: 'accepted', rejected: 'rejected'}
  enum :status, STATUSES

  validates :email, :unique_key, presence: true
  validates_format_of :email, with: Devise::email_regexp

  before_validation :set_unique_key
  before_update :set_expired_at

  private

  def set_unique_key
    unique_key = nil
    loop do
      unique_key =  SecureRandom.base64(12)
      break unique_key unless Invitation.find_by(unique_key: unique_key)
    end

    self.unique_key = unique_key
  end

  def set_expired_at
    return if self.expired_at.present?

    self.expired_at = Time.zone.now
  end
end