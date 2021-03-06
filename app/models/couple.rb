class Couple < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip
  has_attached_file :couple_avatar, styles: { medium: '300x300#', thumb: '100x100#' },
                                    default_url: "https://s3-us-west-2.amazonaws.com/marry-me-production/public/avatars/default/:style/marry-me-logo.jpg",
                                    url: ':s3_domain_url',
                                    path: 'public/avatars/couples/:id/:style_:basename.:extension',
                                    storage: :fog,
                                    fog_credentials: {
                                      provider: 'AWS',
                                      aws_access_key_id: ENV['AWSAccessKeyId'],
                                      aws_secret_access_key: ENV['AWSSecretKey'],
                                      region: 'us-west-2'
                                    },
                                    fog_directory: ENV['FOG_DIRECTORY']
  validates_attachment_content_type :couple_avatar, content_type: /\Aimage\/.*\Z/

  has_many :contracts
  has_many :families
  has_many :vendors, through: :contracts
  has_many :comments

  # Comment methods
  def wedding_vendor(vendor)
    self.vendors.find_by(id: vendor.id)
  end

  def contract_accepted(vendor)
    contract = self.contracts.find_by(vendor_id: vendor.id)
    true if contract.couple_pending == false && contract.vendor_pending == false
  end

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
      couple.password = Devise.friendly_token[0, 20]
    end
  end
end
