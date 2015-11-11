class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip

  has_attached_file :vendor_avatar, styles: { medium: '300x300#', thumb: '100x100#' },
                                    default_url: "https://s3-us-west-2.amazonaws.com/marry-me-production/public/avatars/default/:style/marry-me-logo.jpg",
                                    url: ':s3_domain_url',
                                    path: 'public/avatars/vendors/:id/:style_:basename.:extension',
                                    storage: :fog,
                                    fog_credentials: {
                                      provider: 'AWS',
                                      aws_access_key_id: ENV['AWSAccessKeyId'],
                                      aws_secret_access_key: ENV['AWSSecretKey'],
                                      region: 'us-west-2'
                                    },
                                    fog_directory: ENV['FOG_DIRECTORY']
  validates_attachment_content_type :vendor_avatar, content_type: /\Aimage\/.*\Z/

  has_many :contracts
  has_many :couples, through: :contracts
  has_many :comments

  # geocoder
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{self.try(:address)}, #{self.try(:city)}, #{self.try(:state)}"
  end

  # SQL search
  def self.search(query)
    results = where('name ilike ?
                     OR city ilike ?
                     OR state ilike ?
                     OR zip ilike ?
                     OR category ilike ?', "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
    if results.any?
      results
    end
  end

  # Contract methods
  def pending_contracts
    self.contracts.where(vendor_pending: false, couple_pending: true)
  end

  def request_contracts
    self.contracts.where(vendor_pending: true, couple_pending: false)
  end

  def active_contracts
    self.contracts.where(vendor_pending: false, couple_pending: false)
  end

  # Sort methods
  def self.by_category(sort_category)
    where(category: sort_category)
  end

  def self.categories
    %w(Music Venue Florist Baker Caterer Photographer Videographer Photobooth
       Invitation Rental Attire Other)
  end

  # Omniauth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |vendor|
      vendor.email = auth.info.email
      vendor.password = Devise.friendly_token[0, 20]
    end
  end

  # all states
  def self.states
    # could clean this up by using the carmen rails gem
    ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado',
     'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho',
     'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Lousiana', 'Maine',
     'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi',
     'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
     'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
     'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
     'South Carolina', 'South Dakota', 'Tennesse', 'Texas', 'Utah', 'Vermont',
     'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
  end

end
