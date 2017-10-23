module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    ActionController::Parameters.action_on_unpermitted_parameters = :raise

    rescue_from ActionController::UnpermittedParameters do |e|
      json_response({ message: e.message }, :bad_request)
    end
  end
end