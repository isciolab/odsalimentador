class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
  belongs_to :group_city, class_name: 'GroupCity', foreign_key: 'group_cities_id'
  has_many :indicator_values

  mount_uploader :avatar, AvatarUploader ##esto subira la imagen
end
