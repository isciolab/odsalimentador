class Department < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :cities

  mount_uploader :avatar, AvatarUploader ##esto subira la imagen


end
