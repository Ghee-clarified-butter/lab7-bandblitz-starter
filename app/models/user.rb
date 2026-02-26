class User < ApplicationRecord
  belongs_to :band
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  # validates :role, presence: true, inclusion: { in: [0, 1], message: "must be either 0 (admin) or 1 (regular user)" }
  # validates :active, inclusion: { in: [true, false], message: "must be true or false" }

  # enum role: { admin: 0, regular_user: 1 }

  # scope :active_users, -> { where(active: true) }
  # scope :inactive_users, -> { where(active: false) }

  def proper_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end
end
