class AddDepartmentsIdToCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :department, foreign_key: true
  end
end
