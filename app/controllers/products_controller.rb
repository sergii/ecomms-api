class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update]

  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # POST /products
  def create
    @product = Product.create!(product_params)
    json_response(@product, :created)
  end

  # PUT/products/:id
  def update
    Product.update(product_params)
    head :no_content
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.permit(:name, :brand, :model, :sku, :price, :desc)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
