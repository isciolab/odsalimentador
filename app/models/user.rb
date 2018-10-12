class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :surname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :role_id, presence: true, uniqueness: true
  validates :city_id, presence: true

  belongs_to :role
  belongs_to :city

end
