class Target < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :goal_id, presence: true
  validates :number, presence: true,uniqueness: true
  belongs_to :goal
end
