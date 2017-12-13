# class ApplicationController < ActionController::API
#   include ActionController::HttpAuthentication::Basic::ControllerMethods
#   http_basic_authenticate_with name: "dhh", password: "password", except: :index
#
#   def index
#     render plain: "Everyone can see me!"
#   end
#
#   def edit
#     render plain: "I'm only accessible if you know the super secret password."
#   end
#
#   include Response
#
#   rescue_from ActiveRecord::RecordNotFound do |exception|
#     json_response({ message: exception.message }, :not_found)
#
#   end
#
#   rescue_from ActiveRecord::RecordInvalid do |exception|
#     json_response({ message: exception.message }, :unprocessable_entity)
#   end
# end
class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user
  private
  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
