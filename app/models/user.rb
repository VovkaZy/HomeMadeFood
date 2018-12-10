# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable

  validates :fullname, presence: true, length: { maximum: 50 }

  # Check if email in db, then return user with this email if not,
  # we create new user with random pass
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.fullname = auth.info.name
      user.image = auth.info.image
      user.uid = auth.uid
      user.provider = auth.provider
      # If you are using confirmable and the provider(s)
      # you use validate emails, uncomment the line below
      # to skip the confirmation emails.
      user.skip_confirmation!
    end
  end
end
