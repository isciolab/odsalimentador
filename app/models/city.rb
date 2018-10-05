class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
  belongs_to :group_city
  has_many :indicator_values

  mount_uploader :avatar, AvatarUploader ##esto subira la imagen
end
