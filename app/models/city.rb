class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
end
