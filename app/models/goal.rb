class Goal < ApplicationRecord
    validates :name, presence: true
    validates :number, presence: true, uniqueness: true,:if=> 'self.changed?'
    has_many  :target
end
