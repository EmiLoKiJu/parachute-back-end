class Parachute < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :rent, presence: true
  validates :description, presence: true
  validates :min_duration, presence: true
  validates :city, presence: true
  validates :photo_link, presence: true
end
