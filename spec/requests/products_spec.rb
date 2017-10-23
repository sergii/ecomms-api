require 'rails_helper'

describe 'Products API', type: :request do
  before(:all) { create_list(:product, 50) }

  let(:product) { Product.first }
  let(:product_id) { product.id }

  describe 'GET /products' do
    before { get '/products' }

    it 'returns list of all products' do
      expect(json).not_to be_empty
      expect(json.size).to eq(50)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products/:id' do
    before { get "/products/#{product_id}" }

    context 'when the record exists' do
      it 'returns product' do
        expect(json).not_to be_empty
        expect(json[:id]).to eq(product_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:product_id) { 1001 }

      it 'returns a not found message' do
        expect(json[:message]).to eq("Couldn't find Product with 'id'=#{product_id}")
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /products' do
    context 'with valid payload' do
      let(:valid_payload) do
        {
          product: {
            name: 'IPhone',
            brand: 'Apple',
            model: 'X',
            sku: '024f8ec0-193e-4897-8b3c-1b315691a3b5',
            price: '999',
            desc: 'An all‑new 5.8‑inch Super Retina screen fills the hand and dazzles the eyes.'
          }
        }
      end

      before { post '/products', params: valid_payload }

      it 'creates a product' do
        expect(json[:name]).to eq('IPhone')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'with invalid payload' do
      let(:invalid_payload) do
        {
          product: {
            name: 'IPhone',
            brand: '',
            model: 'X',
            sku: '024f8ec0-193e-4897-8b3c-1b315691a3b5',
            price: '999',
            desc: 'An all‑new 5.8‑inch Super Retina screen fills the hand and dazzles the eyes.'
          }
        }
      end

      before { post '/products', params: invalid_payload }

      it 'returns a validation failure message' do
        expect(json[:message]).to match(/Validation failed: Brand can't be blank/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /products/:id' do
    let(:price) { 1000 }
    let(:valid_permitted_attribute)   { { product: { price: 1000000  } } }
    let(:valid_unpermitted_attribute) { { product: { brand: 'Adidas' } } }
    let(:get_product) { get "/products/#{product_id}" }

    context 'with valid price' do

      before { put "/products/#{product_id}", params: valid_permitted_attribute }

      context 'when the record exists' do
        it 'returns empty body' do
          expect(response.body).to be_empty
        end

        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end

        it 'updates the price' do
          get_product
          expect(json[:name]).not_to eq(product.price)
        end
      end

      context 'when the record not found' do
        let(:product_id) { 0 }

        it 'returns a not found message' do
          expect(json[:message]).to eq("Couldn't find Product with 'id'=#{product_id}")
        end

        it 'returns status code 404' do
          expect(response).to have_http_status(404)
        end
      end
    end

    context 'when try to update another attribute' do

      before { put "/products/#{product_id}", params: valid_unpermitted_attribute }

      it 'returns a validation failure message' do
        expect(json[:message]).to match(/found unpermitted parameter: :brand/)
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
