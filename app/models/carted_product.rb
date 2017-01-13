class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :user 

  validates :quantity, numericality: true, presence: true
end
