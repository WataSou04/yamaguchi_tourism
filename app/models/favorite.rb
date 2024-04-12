class Favorite < ApplicationRecord
  belongs_to :customer
  belongs_to :tourist_spot
  
  validates :customer_id, uniqueness: {scope: :tourist_spot_id}
end
