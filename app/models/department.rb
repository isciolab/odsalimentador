class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  has_many :cities
end
