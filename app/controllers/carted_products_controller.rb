class CartedProductsController < ApplicationController
  def new
  end

  def create
    carted_product = CartedProduct.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    @cart.save

    flash[:success] = "Your Product was successfully checked out!"
    redirect_to "/checkout"
  end
end
