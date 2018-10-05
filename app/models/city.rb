class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
  belongs_to :group_city
end
