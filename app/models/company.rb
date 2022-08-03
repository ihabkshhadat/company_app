class Company < ApplicationRecord
  has_many :users, dependent: :destroy
  DAYS = %i[Sunday Monday Tuesday Wednesday Thursday Friday Saturday].to_h { |i| [i, i] }
  serialize :working_days, Array
end
