class GoalGroup < ApplicationRecord
  validates :name, presence: true,uniqueness: true
end
