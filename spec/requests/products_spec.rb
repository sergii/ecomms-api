require 'rails_helper'

describe 'Products API', type: :request do
  let!(:products) { create_list(:product, 50)}
  let(:product_id) { products.first.id }

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

      it 'returns status 200' do
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
          name: 'IPhone',
          brand: 'Apple',
          model: 'X',
          sku: '024f8ec0-193e-4897-8b3c-1b315691a3b5',
          price: '999',
          desc: 'An all‑new 5.8‑inch Super Retina screen fills the hand and dazzles the eyes.'
        }
      end

      before { post '/products', params: valid_payload }

      it 'creates a product' do
        expect(json[:name]).to eq('IPhone')
      end

      it 'returns status code 201' do
        expect(response.status).to eq(201)
      end
    end

    context 'with invalid payload' do
      let(:invalid_payload) do
        {
          name: 'IPhone',
          brand: '',
          model: 'X',
          sku: '024f8ec0-193e-4897-8b3c-1b315691a3b5',
          price: '999',
          desc: 'An all‑new 5.8‑inch Super Retina screen fills the hand and dazzles the eyes.'
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
end
