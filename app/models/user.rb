class User < ApplicationRecord
  include EmailRegex

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable,
  :password_archivable

  has_many :todos, dependent: :destroy

  validates :full_name, presence: true,
                        length:   { maximum: 80 }

  validates :email, presence:   true,
                    uniqueness: { case_sensitive: false },
                    length:     { maximum: 150 },
                    format:     { with: EMAIL_REGEX, allow_blank: true },
                    immutable:  true

  validates :password,  presence:     true,
                        confirmation: true,
                        length:       { within: 8..70, allow_blank: true },
                        if:           :password_required?

  protected

  # Checks whether a password is needed or not. For validations only.
  # Passwords are always required if it's a new record, or if the password
  # or confirmation are being set somewhere.
  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end

  # Use Active Job to deliver Devise emails in the background
  # https://github.com/heartcombo/devise#active-job-integration
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
