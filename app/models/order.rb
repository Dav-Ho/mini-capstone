class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def order_subtotal
    product.price * quantity
  end

  def tax
    product.price * quantity * 0.09
  end

  def total
    product.price * quantity + tax
  end

  def image
    product.image
  end
end
