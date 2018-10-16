class AddDescriptionToTargets < ActiveRecord::Migration[5.1]
  def change
    add_column :targets, :description, :text
  end
end
