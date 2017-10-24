require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /login' do
    let!(:user) { create(:user) }
    let(:headers) { valid_headers.except('Authorization') }

    let(:valid_payload) do
      {
        email: user.email,
        password: user.password
      }.to_json
    end

    let(:invalid_payload) do
      {
        email: Faker::Internet.email,
        password: Faker::Internet.password
      }.to_json
    end

    # Returns auth token when request is valid
    context 'When request is valid' do
      before { post '/login', params: valid_payload, headers: headers }

      it 'returns an authentication token' do
        expect(json[:auth_token]).not_to be_nil
      end
    end

    # Returns failure message when request is invalid
    context 'When request is invalid' do
      before { post '/login', params: invalid_payload, headers: headers }

      it 'returns a failure message' do
        expect(json[:message]).to match(/Invalid credentials/)
      end
    end
  end
end