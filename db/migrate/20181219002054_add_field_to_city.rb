class AddFieldToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :cod_dane, :text
    add_column :cities, :web_page, :text
  end
end
