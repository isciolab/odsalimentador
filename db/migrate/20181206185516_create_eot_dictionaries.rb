class CreateEotDictionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :eot_dictionaries, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :name
      t.text :description
      t.text :indicator
      t.string :ctype

      t.timestamps
    end
  end
end
