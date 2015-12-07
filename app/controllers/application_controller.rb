class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def current_assessment
    @current_assessment ||= Assessment.find_by(uid: current_assessment_uids.last)
  end
  helper_method :current_assessment

  def add_current_assessment(assessment)
    @current_assessment = assessment
    session[:current_assessment_uids] << assessment.uid
  end
  helper_method :add_current_assessment

  def not_found
    raise ActionController::RoutingError.new("Not Found")
  end

  private
  def current_assessment_uids
    session[:current_assessment_uids] ||= []
  end
end
