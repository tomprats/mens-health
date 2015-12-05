class Admin::AssessmentsController < AdminController
  def index
    @assessment = Assessment.new
    @assessments = Assessment.all
  end
end
