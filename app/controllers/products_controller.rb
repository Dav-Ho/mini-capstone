class ProductsController < ApplicationController
  def everything  # one file for each view folder.
    @everything = Product.all
  end

  def xbox
    @xbox = product1.all
  end

  def playstation
    @playstation = product2.all
  end

  def wii_u
    @wii_u = product3.all
  end
end
