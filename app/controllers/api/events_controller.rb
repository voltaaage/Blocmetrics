class API::EventsController < ApplicationController
  before_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin']='*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end

  skip_before_action :verify_authenticity_token

  def create
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    event = Event.new(event_params)
    event.registered_application = registered_application

    if event.save!
      render json: event, status: :created
    else
      render event.errors, status: :unprocessable_entity
    end
  end

  private

  def permission_denied_error
    error(403, 'Permission Denied.')
  end

  def error(status, message = 'Something went wrong')
    response = {
      response_type: "Error",
      message: message
    }
    render json: response.to_json, status: status
  end

  def event_params
    params.permit(:name)
  end
end