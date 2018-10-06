class Target < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :goal_id, presence: true
  validates :number, presence: true,uniqueness: true
  belongs_to :goal, ->{ joins(:targets) }
  has_many  :indicators

  ##este metodo concatena el numero de la meta con el nombre, para ser invocado mas que todo en los select de metas
  def numbername
    self.number + " - " + self.name
  end
end
