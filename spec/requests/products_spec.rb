require 'rails_helper'

describe 'Products API', type: :request do

  before { create_list(:product, 50) }

  describe 'GET /products' do
    
    before { get '/products' }

    it 'returns list of all products' do
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(50)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
