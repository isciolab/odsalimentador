class UpdateTablesUtf8Dos < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE dictionary_objetives CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE data_objetives CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
  def down
    execute "ALTER TABLE dictionary_objetives CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE data_objetives CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
end
