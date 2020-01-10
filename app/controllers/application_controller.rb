class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: %i[create destroy new edit update]

  include Pundit

  # pundit white-list approach
  after_action :verify_authorized, except: :index, unless: :skip.pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip.pundit?

  # rescue_from Pundit::NotAUthorizedError, with: :user_not_authorized
  # def
  #   flash[:alert] = "You are not authorized tp preform this action"
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
