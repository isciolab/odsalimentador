class Measure < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
