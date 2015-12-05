class Assessment < ActiveRecord::Base
  default_scope { order(:created_at) }
  scope :finished, -> { where(finished: true) }

  before_validation :create_assessment, on: :create

  private
  def create_assessment
    self.finished ||= false
    self.uid ||= Traitify.new.create_assessment.id
  end
end
