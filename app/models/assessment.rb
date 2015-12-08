class Assessment < ActiveRecord::Base
  belongs_to :user

  default_scope { order(created_at: :desc) }
  scope :finished, -> { where(finished: true) }

  before_validation :create_assessment, on: :create

  def to_param
    uid
  end

  def results
    r = Rails.cache.fetch("assessment-#{uid}")
    unless r
      r = Traitify.new.assessment_with_results(uid, "linear", %w(traits types))
      Rails.cache.write("assessment-#{uid}", r)
    end

    r
  end

  private
  def create_assessment
    self.finished ||= false
    self.uid ||= Traitify.new.create_assessment.id
  end
end
