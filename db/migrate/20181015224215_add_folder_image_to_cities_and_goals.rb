class AddFolderImageToCitiesAndGoals < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :folder_avatar, :string, :default => "logos/goals/"
    add_column :cities, :folder_avatar, :string, :default => "logos/cities/"
  end
end
