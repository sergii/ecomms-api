class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # GET /products/:id
  def show
    @product = Product.find(params[:id])
    json_response(@product)
  end
end
