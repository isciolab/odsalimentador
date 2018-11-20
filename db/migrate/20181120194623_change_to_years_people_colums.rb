class ChangeToYearsPeopleColums < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE `people`
  CHANGE `answer_year` `answer_year` YEAR NULL;
"
  end
  def down
    execute "ALTER TABLE `people`
  CHANGE `answer_year` `answer_year` varchar(45) NULL;
"
  end
end
