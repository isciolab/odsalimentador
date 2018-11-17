class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role_id, presence: true
  validates :city_id, presence: true

  belongs_to :role
  belongs_to :city

end
