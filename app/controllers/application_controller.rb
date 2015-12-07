class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def set_current_user(user)
    session[:current_user_id] = user.id
    Assessment.where(uid: current_assessment_uids, user_id: nil).update_all(user_id: user.id)
  end
  helper_method :set_current_user

  def current_assessment
    current_assessments.first
  end
  helper_method :current_assessment

  def finished_assessment
    current_assessments.finished.first
  end
  helper_method :finished_assessment

  def current_assessments
    if current_user
      @current_assessments ||= current_user.assessments
    else
      @current_assessments ||= Assessment.where(uid: current_assessment_uids)
    end
  end
  helper_method :current_assessments

  def add_current_assessment(assessment)
    @current_assessment = assessment
    @current_assessments = nil
    session[:current_assessment_uids].prepend assessment.uid
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
