class AddTargetTypeToIndicators < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE `indicators`
  ADD COLUMN `target_type` ENUM('INCREMENT','DECREMENT') NULL;
;"
  end
  def down
    remove_column :indicators, :target_type
  end
end
