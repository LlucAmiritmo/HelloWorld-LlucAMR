class Role < ApplicationRecord

  has_many :users

  before_validation :set_boolean_defaults

  validates :code, presence: true, uniqueness: true
  validates :description, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :user, inclusion: { in: [true, false] }

  private

  def set_boolean_defaults
    self.admin = false if admin.nil?
    self.user = false if user.nil?
  end
end