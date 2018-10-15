class AvatarUploader < CarrierWave::Uploader::Base
  ##con esto defino la ruta a guardar, dentro de la carpeta public ubicada en la raiz.
  # model.folder_avatar es una rupa especifida dada a los logos, viene de la base de datos
  # model.id.to_s es el id convertido a cadena de texto para que pueda guardarse
  def store_dir
    model.folder_avatar+"/"+model.id.to_s
  end
end
