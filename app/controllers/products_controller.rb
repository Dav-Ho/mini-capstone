class ProductsController < ApplicationController
  
  def everything
    @everything = Product.all # one file for each view folder.
  end

  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def form
    Product.create(
    name: params[:item_name],
    price: params[:price],
    color: params[:color],
    description: params[:description]
    )
    render "new.html.erb"
  end
end
