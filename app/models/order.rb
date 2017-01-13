class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  has_many :carted_products
  has_many :products, through: :carted_products

validates :subtotal, numericality: true, presence: true
validates :tax, numericality: true, presence: true
validates :total, numericality: true, presence: true
end
