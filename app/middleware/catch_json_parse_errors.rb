class CatchJsonParseErrors
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue ActionDispatch::Http::Parameters::ParseError => error
      if env['HTTP_ACCEPT'] =~ /application\/json/ || env['CONTENT_TYPE'] =~ /application\/json/
        message = Message.json_parse_error
        return [
          400, { "Content-Type" => "application/json" },
          [ { error: error, message: message }.to_json ]
        ]
      else
        raise error
      end
    end
  end
end