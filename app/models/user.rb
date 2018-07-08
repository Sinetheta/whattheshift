class User < ApplicationRecord
  devise :database_authenticatable,
         :omniauthable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  def self.from_omniauth(auth)
    where(email: auth[:info][:email]).or(
      where(provider: auth[:provider], uid: auth[:uid])
    ).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def link_account_from_omniauth(auth)
    self.email = auth[:info][:email] if self.email.blank?
    self.provider = auth[:provider]
    self.oauth_token = auth[:credentials][:token]
    self.oauth_expires_at = Time.at(auth[:credentials][:expires]) if auth[:credentials].try(:[], :expires)
    self.uid = auth[:uid]
    self.save
  end
end
