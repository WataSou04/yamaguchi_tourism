class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reviews
  has_many :comments
  has_many :favorites, dependent: :destroy
  
  GUEST_CUSTOMER_EMAIL = "guest@example.com"
  
  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.first_name = "guest"
      customer.last_name = "user"
      customer.first_name_kana = "ゲスト"
      customer.last_name_kana = "ユーザー"
      customer.is_active = true
    end
  end
end
