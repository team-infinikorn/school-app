class Invitation < ApplicationRecord
  STATUSES = {accepted: 'accepted', rejected: 'rejected'}
  enum :status, STATUSES

  validates :email, :unique_key, presence: true
  validates_format_of :email, with: Devise::email_regexp, if: :is_email?

  before_validation :set_unique_key
  before_update :set_expired_at

  private

  def set_unique_key
    self.unique_key = SecureRandom.base64(12)
  end

  def set_expired_at
    self.expired_at = Time.zone.now
  end

  def is_email?
    email.present?
  end
end