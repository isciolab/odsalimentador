class ChangeUtf8Tablets < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE targets CONVERT TO CHARACTER SET utf8"
    execute "ALTER TABLE goals CONVERT TO CHARACTER SET utf8"
    execute "ALTER TABLE indicators CONVERT TO CHARACTER SET utf8"
  end
  def down

  end
end
