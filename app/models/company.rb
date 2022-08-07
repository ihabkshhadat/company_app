class Company < ApplicationRecord
  default_scope {order('id DESC')}

  has_many :users, dependent: :destroy
  DAYS = %i[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].to_h { |i| [i, i] }
  serialize :working_days, Array
  validates :business_name, presence: true
  before_create do
    self.working_days = working_days.reject(&:blank?)
  end
end
