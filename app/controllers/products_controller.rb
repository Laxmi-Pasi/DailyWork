class ProductsController < ApplicationController
  def index
    @products=Product.all
  end

  def show
    redirect_back(fallback_location: new_product_path)
  end

  def new
  end

  def edit
    redirect_back(fallback_location: products_path)
  end
end
