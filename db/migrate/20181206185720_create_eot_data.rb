class CreateEotData < ActiveRecord::Migration[5.1]
  def change
    create_table :eot_data,:options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :city
      t.string :answer_year
      t.string :response
      t.timestamps
    end
  end
end
