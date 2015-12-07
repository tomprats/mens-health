class Assessment < ActiveRecord::Base
  belongs_to :user

  default_scope { order(:created_at) }
  scope :finished, -> { where(finished: true) }

  before_validation :create_assessment, on: :create

  def to_param
    uid
  end

  private
  def create_assessment
    self.finished ||= false
    self.uid ||= Traitify.new.create_assessment.id
  end
end
