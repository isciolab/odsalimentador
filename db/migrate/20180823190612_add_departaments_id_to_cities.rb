class AddDepartamentsIdToCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :departament, foreign_key: true
  end
end
