class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png' ##formato a convertir
  process :tags => ['city_avatar'] ##etiqueta que va a tener en cludinary
  process :folder =>"ciudatos_ods"

  version :standard do
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    resize_to_fit(50, 50)
  end

  def public_id
    return "ciudatos_ods/"+model.name ##nombre y ruta de cludinary donde se guardara
  end
end
