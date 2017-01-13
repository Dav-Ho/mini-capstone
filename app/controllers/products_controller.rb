class ProductsController < ApplicationController
  # before_action :authorize_admin!, except: [:index, :show]

  def index
    @products = Product.all
    if params[:sort]
      @products = Product.order(params[:sort])
    elsif params[:sort_desc]
      @products = Product.order(params[:sort_desc] => :desc)
    elsif params[:discount]
      @products = Product.where("price < ?", 2)
      render "index.html.erb"
    elsif params[:full_price]
      @products = Product.where("price > ?", 100)
    elsif params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample

    else
      @product = Product.find_by(id: params[:id])
      render "show.html.erb"
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(
      name: params[:name],
      price: params[:price],
      color: params[:color],
      description: params[:description]
    )
    if @product.valid?
      flash[:success] = "This was created"
      redirect_to "/products/#{@product.id}"
    else
      flash[:warning] = @product.errors.full_messages
      render "new.html.erb"
    end
  end

  def edit
    @product = Product.find_by(id: params[:id])
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
    if @product.valid?
      flash[:success] = "#{@product.name} was successful"
      redirect_to "/products/#{@product.id}"
    else
      flash[:warning] = "There is something wrong"
      render "edit"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:success] = "#{@product.title} was destroyed!"
    redirect_to "/products"
  end
end
