class AddImageMapaToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :folder_img_mapa, :string, :default => "images/maps/cities/"
    add_column :cities, :image_mapa, :string
  end
end
