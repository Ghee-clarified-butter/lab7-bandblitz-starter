class User < ApplicationRecord
  belongs_to :band
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def proper_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
