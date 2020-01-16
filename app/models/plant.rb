class Plant < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address

  mount_uploader :photo, PhotoUploader
  validates :name, presence: true
  validates :description, presence: true
  validates :care_instructions, presence: true
  validates :price, presence: true
  validates :avail_from, presence: true, null: false
  validates :avail_to, presence: true, null: false

  after_validation :geocode, if: :will_save_change_to_address?

end
