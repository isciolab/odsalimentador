class Goal < ApplicationRecord
    validates :name, presence: true
    validates :number, presence: true, uniqueness: true,:if=> 'self.changed?'
    has_many  :targets

    mount_uploader :avatar, AvatarUploader ##esto subira la imagen
end
