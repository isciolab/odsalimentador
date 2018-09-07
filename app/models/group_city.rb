class GroupCity < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
