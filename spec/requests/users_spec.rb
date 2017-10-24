require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  describe 'POST /signup' do
    context 'when valid request' do
      before do
        params = { user: valid_attributes }.to_json
        post '/signup', params: params, headers: headers
      end

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json[:message]).to match(/Account successfully created/)
      end

      it 'returns an authentication token' do
        expect(json[:auth_token]).not_to be_nil
      end

      context 'when trying register existing user email' do
        before do
          params = { user: valid_attributes }.to_json
          post '/signup', params: params, headers: headers
        end

        it 'returns error message' do
          expect(response).to have_http_status(422)
        end

        it 'raises validation' do
          expect(json[:message]).to match(/Validation failed: Email has already been taken/)
        end
      end
    end

    context 'when invalid request' do
      context 'with no password' do
        before do
          params = { user: valid_attributes.except(:password) }.to_json
          post '/signup', params: params, headers: headers
        end

        it 'does not create a new user' do
          expect(response).to have_http_status(422)
        end

        it 'returns failure message' do
          expect(json[:message])
            .to match(/Validation failed: Password digest can't be blank, Password can't be blank/)
        end
      end

      context 'with empty params' do
        before { post '/signup', params: {}, headers: headers }

        it 'does not create a new user' do
          expect(response).to have_http_status(400)
        end

        it 'returns failure message' do
          expect(json[:message])
            .to match(/param is missing or the value is empty: user/)
        end
      end
    end
  end
end