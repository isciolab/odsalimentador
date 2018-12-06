class UpdateTablesUtf8Tres < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE dict_univ_cities CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE university_cities CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
  def down
    execute "ALTER TABLE dict_univ_cities CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
    execute "ALTER TABLE university_cities CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"
  end
end
