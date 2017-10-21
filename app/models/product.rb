class Product < ApplicationRecord
  validates_presence_of :name, :brand, :model, :sku, :price, :desc
end
