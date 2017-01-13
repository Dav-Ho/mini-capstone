class User < ActiveRecord::Base
  has_secure_password

  has_many :orders
  has_many :carted_products
  
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 8}, presence: true
end
