class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :category_products
  has_many :categories, through: :category_products
  
  def sale_message
    if price < 2
      "Discount Item!"
    else
      "On Sale!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end
end
