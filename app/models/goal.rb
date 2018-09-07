class Goal < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :number, presence: true, uniqueness: true
    has_many  :target
end
