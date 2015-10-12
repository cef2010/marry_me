class Couple < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :contracts
  has_many :vendors, through: :contracts
  delegate :musics, :venues, :florists, :bakers, :caterers, :photographers, :videographers, :photobooths, :invitations, :others, to: :vendors

  # Contract methods
  def pending_contracts
    self.contracts.where(couple_pending: false, vendor_pending: true)
  end

  def request_contracts
    self.contracts.where(couple_pending: true, vendor_pending: false)
  end

  def active_contracts
    self.contracts.where(couple_pending: false, vendor_pending: false)
  end

  # OmniAuth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |couple|
      couple.email = auth.info.email
      couple.password = Devise.friendly_token[0,20]
    end
  end
end


# , :omniauthable, :omniauth_providers => [:facebook]
