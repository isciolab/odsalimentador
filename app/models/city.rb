class City < ApplicationRecord
  validates :department_id, presence: true
  belongs_to :department
  belongs_to :group_city, class_name: 'GroupCity', foreign_key: 'group_cities_id'
  has_many :indicator_values
  has_many :users

  mount_uploader :avatar, AvatarUploader ##esto subira la imagen

  require 'csv'

  def self.importar(file)

    i = 0

    @dataprincipal= Array.new

    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataprincipal = [:name, :group_cities_id, :is_capital, :goal_group_id, :rccv_program, :total_population,
                            :metropolitan_area,:city_system_dnp,:dnp_category,:ddt_typology,:department_id,:description,
                            :urban_population,:rural_population,:total_area,:foundation_year]
    lastdataprincip = OdsCiudatosDatum.last() #busco el ultimo registro

    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |fila|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        encabezado = fila
        if lastdataprincip.blank?

        else
          #entra aqui si ya hay al menos un registro en data_objetives, y guardo el ultimo id insertado en "i"
          i = lastdataprincip.id

        end

      else
        contcabecera=0
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        #recorro el encabezado que tiene las preguntas

        @groupcity = Array.new

        puts fila.inspect
        if fila[3] != nil && fila[3].strip != "#!NULO!" && fila[3].strip != "#¡NULO" &&
            fila[3]!= "" &&
            fila[3].strip != "#¡NULO!" &&
            fila[3].strip != "#!NULO¡" &&
            fila[3].strip!= "" &&  fila[3].strip!= "NA" &&  fila[3].strip!= "na" &&
            fila[3].strip!= "N/A" && fila[3].strip!="No Disponible"
          #almaceno la respuesta

          @groupcity = GroupCity.where(name: fila[18])

          if @groupcity == ""
            @groupcity = EotDictionary.new
            @groupcity.name = cebecera.strip
            @groupcity.save!
          end

          @dataprincipal << {
              :group_cities_id => fila[0],
              :is_capital => fila[1],
              :goal_group_id=> fila[2],
              :rccv_program=>fila[3],
              :total_population=>fila[4],
              :metropolitan_area=>fila[5],
              :city_system_dnp=>fila[6],
              :dnp_category=>fila[5],
              :ddt_typology=>fila[5],
              :department_id=>fila[5],
              :description=>fila[5],
              :urban_population=>fila[5],
              :rural_population=>fila[5],
              :total_area=>fila[5],
              :foundation_year=>fila[5],
              :cod_dane=>fila[5]
          }
          contcabecera = contcabecera + 1
        end

      end

      i = i + 1
    end
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    City.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
