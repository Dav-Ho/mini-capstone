class OrdersController < ApplicationController
  before_action :authenticate_admin!

  def create
    @order = Order.create(user_id: current_user.id)
    @carts = CartedProduct.where(user_id: current_user.id, status: "carted")

    subtotal = 0

    @carts.each do |cart|
      subtotal += cart.product.price * cart.quantity
      cart.update(order_id: @order.id, status:"purchased")
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    @order.update(
    subtotal: subtotal,
    tax: tax,
    total: total
    )

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @carts = @order.carted_products
    if @order.user_id == current_user.id
      @carts
    else
      redirect_to "/products"
    end
  end
end
