class City < ApplicationRecord
  require 'csv'

  belongs_to :department,optional: true
  belongs_to :group_city, class_name: 'GroupCity', foreign_key: 'group_cities_id',optional: true
  has_many :indicator_values
  has_many :users

  mount_uploader :avatar, AvatarUploader ##esto subira la imagen


  def self.importar(file)

    i = 0

    @dataprincipal = Array.new

    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataprincipal = [:name, :group_cities_id, :is_capital, :goal_group_id, :rccv_program, :total_population,
                            :metropolitan_area, :city_system_dnp, :dnp_category, :ddt_typology, :department_id, :description,
                            :urban_population, :rural_population, :total_area, :foundation_year]
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |fila|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        encabezado = fila

      else
        contcabecera = 0
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        #recorro el encabezado que tiene las preguntas

        @groupcity = Array.new


        if fila[3] != nil && fila[3].strip != "#!NULO!" && fila[3].strip != "#¡NULO" &&
            fila[3] != "" &&
            fila[3].strip != "#¡NULO!" &&
            fila[3].strip != "#!NULO¡" &&
            fila[3].strip != "" && fila[3].strip != "NA" && fila[3].strip != "na" &&
            fila[3].strip != "N/A" && fila[3].strip != "No Disponible"
          #almaceno la respuesta

          ##@groupcity = GroupCity.where(name: fila[18])
          @groupods = GoalGroup.where(name: fila[18])

          if @groupods.exists?
            @groupods.each do |filagrupo|
              ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
              @groupods = filagrupo
            end
          else
            @groupods = GoalGroup.new
            @groupods.name = fila[18].strip
            @groupods.save!
          end
          @city = City.select("upper(name) as name").where(name: fila[3].upcase)

          puts @city

          if @city.exists?
            @city.update(:name => fila[3].upcase,
                         :group_cities_id => nil,
                         :is_capital => fila[17] == "Capital" ? 1 : 0,
                         :goal_group_id => @groupods.id,
                         :rccv_program => fila[2],
                         :total_population => fila[6],
                         :metropolitan_area => fila[12],
                         :city_system_dnp => fila[13],
                         :dnp_category => fila[14],
                         :ddt_typology => fila[15],
                         :department_id => nil,
                         :description => nil,
                         :urban_population => fila[18],
                         :rural_population => nil,
                         :total_area => fila[10],
                         :foundation_year => fila[4],
                         :cod_dane => fila[1]
            )
          else
            @dataprincipal << {
                :name => fila[3].upcase,
                :group_cities_id => nil,
                :is_capital => fila[17] == "Capital" ? 1 : 0,
                :goal_group_id => @groupods.id,
                :rccv_program => fila[2],
                :total_population => fila[6],
                :metropolitan_area => fila[12],
                :city_system_dnp => fila[13],
                :dnp_category => fila[14],
                :ddt_typology => fila[15],
                :department_id => nil,
                :description => nil,
                :urban_population => fila[18],
                :rural_population => nil,
                :total_area => fila[10],
                :foundation_year => fila[4],
                :cod_dane => fila[1]
            }
            contcabecera = contcabecera + 1
          end
        end

      end

      i = i + 1
    end
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    City.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
