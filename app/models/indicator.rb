class Indicator < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :target_id, presence: true
  validates :number, presence: true,uniqueness: true
  belongs_to :target
  has_many :indicator_values
end
