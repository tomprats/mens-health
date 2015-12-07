class AssessmentsController < ApplicationController
  def create
    if current_assessment && !current_assessment.finished
      redirect_to assessment_path(current_assessment)
    else
      assessment = Assessment.create(user_id: session[:current_user_id])
      add_current_assessment(assessment)

      redirect_to assessment_path(assessment)
    end
  end

  def show
    @assessment = Assessment.find_by(uid: params[:uid])

    redirect_to assessment_results_path(@assessment) if @assessment.finished
  end

  def results
    @assessment = Assessment.find_by(uid: params[:uid])

    @results = Traitify.new.find_results(@assessment.uid)
    @type = @results.personality_types.first.personality_type

    unless @assessment.finished
      @assessment.update(
        finished: true,
        type_name: @type.name
      )
    end
  rescue
    redirect_to assessment_path(@assessment)
  end
end
