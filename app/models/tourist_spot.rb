class TouristSpot < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_one_attached :image
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :address, presence: true
  validates :season, presence: true
  
  geocoded_by :address
  after_validation :geocode
  
  enum season: { spring: 0, summer: 1, autumn: 2, winter: 3 }
end
