class Admin::AnalyticsController < AdminController
  def index
    @assessments = Assessment.all
    @personalities = Assessment.unscoped.finished
      .select("type_name, MAX(id) as total")
      .group(:type_name).order("total desc")
  end
end
