class CartedProductsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @carts = CartedProduct.where(user_id: current_user, status:
    "carted")
    if @carts.empty?
      flash[:info] = "Your cart is empty - check out some of these products@"
      redirect_to "/products"
    end
  end

  def new
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    session[:cart_count] +=1
    redirect_to "/carted_product"
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.update(status: 'removed')
    session[:cart_count] = nil
    flash[:success] = "#{carted_product.product.name} was removed from your cart"
    redirect_to "/carted_products"
  end
end
