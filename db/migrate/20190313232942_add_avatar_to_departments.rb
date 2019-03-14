class AddAvatarToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :avatar, :string
  end
end
