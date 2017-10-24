class Message
  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.account_created
    'Account successfully created'
  end

  def self.json_parse_error
    'There was a problem in the JSON you submitted'
  end
end