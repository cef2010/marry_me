class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip
  has_attached_file :vendor_avatar, styles: { medium: '300x300>', thumb: '100x100#' },
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

  def self.search(query)
    names = where('name like ?', "%#{query}%")
    categories = where('category like ?', "%#{query}%")
    city = where('city like ?', "%#{query}%")
    state = where('state like ?', "%#{query}%")
    zip = where('zip like ?', "%#{query}%")
    if names.any?
      names
    elsif categories.any?
      categories
    elsif city.any?
      city
    elsif state.any?
      state
    elsif zip.any?
      zip
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
     'Washingoton', 'West Virginia', 'Wisconsin', 'Wyoming']
  end

  # ex-STI stuff
  def self.categories
    %w(Music Venue Florist Baker Caterer Photographer Videographer Photobooth
       Invitation Rental Attire Other)
  end

  def self.musics
    where(category: 'Music')
  end

  def self.venues
    where(category: 'Venue')
  end

  def self.florists
    where(category: 'Florist')
  end

  def self.bakers
    where(category: 'Baker')
  end

  def self.caterers
    where(category: 'Caterer')
  end

  def self.photographers
    where(category: 'Photographer')
  end

  def self.videographers
    where(category: 'Videographer')
  end

  def self.photobooths
    where(category: 'Photobooth')
  end

  def self.invitations
    where(category: 'Invitation')
  end

  def self.attires
    where(category: 'Attire')
  end

  def self.rentals
    where(category: 'Rental')
  end

  def self.others
    where(category: 'Other')
  end
end
