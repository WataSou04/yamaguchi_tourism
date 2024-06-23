class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :tourist_spot
  has_many :comments
  has_one_attached :image
  
  validates :evaluation, presence: true
  validates :thoughts, presence: true
end
