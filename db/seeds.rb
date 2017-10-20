file = ActiveSupport::JSON.decode(File.read('db/seeds/products.json'))

Product.create!(file['products'])