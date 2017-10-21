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
end
