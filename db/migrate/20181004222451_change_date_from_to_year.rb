class ChangeDateFromToYear < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE `indicator_values`
  CHANGE `date_from` `date_from` YEAR NULL;
"
  end
  def down
    execute "ALTER TABLE `indicator_values`
  CHANGE `date_from` `date_from` date NULL;
"
  end
end
