class TouristSpot < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :address, presence: true
  validates :category, presence: true
  
  geocoded_by :address
  after_validation :geocode
  
  GUEST_CUSTOMER_EMAIL = "guest@example.com"
  
  def self.search_for(content, method)
    if method == 'perfect'
      TouristSpot.where(name: content)
    elsif method == 'forward'
      TouristSpot.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      TouristSpot.where('name LIKE ?', '%' + content)
    else
      TouristSpot.where('name LIKE ?', '%' + content + '%')
    end
  end
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
