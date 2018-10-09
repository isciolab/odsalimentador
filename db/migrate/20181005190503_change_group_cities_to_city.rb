class ChangeGroupCitiesToCity < ActiveRecord::Migration[5.1]
   def up
       execute "ALTER TABLE `cities`
 CHANGE `group_cities_id` `group_city_id` BIGINT(20) NULL;
   "
     end
   def down
       execute "ALTER TABLE `cities`
 CHANGE `group_city_id` `group_cities_id` BIGINT(20) NULL;
   "
   end
  
  end