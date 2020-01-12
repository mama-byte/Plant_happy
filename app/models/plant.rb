class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :care_instructions, presence: true
  validates :price, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
