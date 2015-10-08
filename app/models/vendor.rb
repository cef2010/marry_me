class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :contracts
  has_many :couples, through: :contracts

  def self.types
    ['Music', 'Venue', 'Florist', 'Baker', 'Caterer', 'Photographer', 'Videographer', 'Photobooth', 'Invitations', 'Rentals', 'Attire', 'Other']
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
    where(type: 'Invitations')
  end

  def self.attires
    where(type: 'Attire')
  end

  def self.rentals
    where(type: 'Rentals')

  def self.others
    where(type: 'Other')
  end

end
