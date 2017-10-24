require 'rails_helper'

RSpec.feature 'A client submits invalid JSON', type: :feature  do
  scenario 'API returns a validation message', js: true do
    invalid_tokens = ', , '
    broken_json = %Q|{"user":{"email":"serhii@ecomms.com"#{invalid_tokens}}}|

    response = post_broken_json_to_api('/signup', broken_json)

    expect(response.response_code).to eq 400
    expect(response.content_type).to match(/application\/json/)
    expect(response.body_str).to match("There was a problem in the JSON you submitted")
  end

  def post_broken_json_to_api(path, broken_json)
    Curl.post("http://#{host}:#{port}#{path}", broken_json) do |curl|
      set_default_headers(curl)
    end
  end

  def host
    Capybara.current_session.server.host
  end

  def port
    Capybara.current_session.server.port
  end

  def set_default_headers(curl)
    curl.headers['Accept'] = 'application/json'
    curl.headers['Content-Type'] = 'application/json'
  end
end