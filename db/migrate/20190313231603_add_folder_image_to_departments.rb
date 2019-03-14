class AddFolderImageToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :folder_avatar, :string, :default => "logos/departments/"
  end
end
