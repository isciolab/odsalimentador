class GroupCity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :cities
end
