class User < ActiveRecord::Base
  has_secure_password
  has_many :assessments

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  validates :email, format: /@/i

  before_validation :format_email

  default_scope { order(:created_at) }
  scope :admin, -> { where(admin: true) }

  def name
    "#{first_name} #{last_name}"
  end

  private
  def format_email
    self.email = self.email.strip.downcase
  end
end
