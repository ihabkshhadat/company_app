class User < ApplicationRecord
  belongs_to :company
  has_many :projects, dependent: :destroy
  enum user_type: { supervisor: 0, developer: 1, marketer: 2 }
  def full_name
    "#{first_name} #{last_name}"
  end
end
