class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :confirmable

  # Email address compliant with RFC 2822 format
  # Matches a normal email address. Does not check the top-level domain.
  # Copied from: https://stackoverflow.com/a/16168103/4640611
  # Demo link: https://regex101.com/r/PTPAJy/1
  EMAIL_REGEX = /\A[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[A-Za-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\z/

  validates :full_name, presence: true,
                        length:   { maximum: 80 }

  validates :email, presence:   true,
                    uniqueness: { case_sensitive: false },
                    length:     { maximum: 150 },
                    format:     { with: EMAIL_REGEX, allow_blank: true }

  validates :password,  presence:     true,
                        confirmation: true,
                        length:       { within: 8..128, allow_blank: true }

  protected

  # Use Active Job to deliver Devise emails in the background
  # https://github.com/heartcombo/devise#active-job-integration
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
