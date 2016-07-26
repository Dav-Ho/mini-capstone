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

  def create
    @product = Product.new(

      name: params[:name],
      price: params[:price],
      color: params[:color],
      description: params[:description],
      image: params[:image]
    )
    @product.save
    redirect_to "/products/#{@product.id}"
    render "create.html.erb"
  end

  def edit
    @product = Product.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @product = Product.find_by(id: params[:id])
      @product.update(
        name: params[:name],
        price: params[:price],
        color: params[:color],
        description: params[:description],
        image: params[:image]
      )
      flash[:success] = "#{@product.name} was successful"
      redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@recipe.title} was destroyed!" 
    redirect_to "/products"
  end
end
