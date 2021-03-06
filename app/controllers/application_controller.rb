class ApplicationController < ActionController::Base
  before_action :doorkeeper_authorize!, only: :me
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def me
    #render json: User.find(doorkeeper_token.resource_owner_id).as_json
    me_user = User.find(doorkeeper_token.resource_owner_id)
    render json: me_user.as_json.merge(:roles => me_user.roles(:select => :name).collect(&:name))
  end
end
