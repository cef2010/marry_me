class Couple < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :contracts
  has_many :vendors, through: :contracts

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |couple|
      couple.email = auth.info.email
      couple.password = Devise.friendly_token[0,20]
    end
  end
end
