class UpdateTablesUtf8 < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE questions CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE people CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  execute "ALTER TABLE person_has_questions CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
  def down
    execute "ALTER TABLE questions CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE people CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE person_has_questions CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
end
