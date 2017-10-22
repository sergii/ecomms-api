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

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :brand, :model, :sku, :price, :desc)
    end
end
