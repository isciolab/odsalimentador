class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
  belongs_to :group_city
  has_many :indicator_values

  mount_uploaders :avatar, AvatarUploader
end
