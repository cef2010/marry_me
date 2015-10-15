class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip
  has_attached_file :vendor_avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" } # ADD DEFAULT URL FOR ICON
  validates_attachment_content_type :vendor_avatar, :content_type => /\Aimage\/.*\Z/

  has_many :contracts
  has_many :couples, through: :contracts

  # geocoder
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    self.address
  end

  # Contract methods
  def pending_contracts
    self.contracts.where(vendor_pending: false, couple_pending: true)
  end

  def request_contracts
    self.contracts.where(vendor_pending: true, couple_pending: false)
  end

  def active_contracts
    self.contracts.where(vendor_pending: false,couple_pending: false)
  end

  # Sort methods
  def self.by_type(sort_type)
    where(type: sort_type)
  end

  # Omniauth
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |vendor|
      vendor.email = auth.info.email
      vendor.password = Devise.friendly_token[0,20]
    end
  end

  # STI stuff
  def self.types
    ['Music', 'Venue', 'Florist', 'Baker', 'Caterer', 'Photographer', 'Videographer', 'Photobooth', 'Invitation', 'Rental', 'Attire', 'Other']
  end

  def self.musics
    where(type: 'Music')
  end

  def self.venues
    where(type: 'Venue')
  end

  def self.florists
    where(type: 'Florist')
  end

  def self.bakers
    where(type: 'Baker')
  end

  def self.caterers
    where(type: 'Caterer')
  end

  def self.photographers
    where(type: 'Photographer')
  end

  def self.videographers
    where(type: 'Videographer')
  end

  def self.photobooths
    where(type: 'Photobooth')
  end

  def self.invitations
    where(type: 'Invitation')
  end

  def self.attires
    where(type: 'Attire')
  end

  def self.rentals
    where(type: 'Rental')
  end

  def self.others
    where(type: 'Other')
  end

end
