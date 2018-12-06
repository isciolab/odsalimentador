
class UniversityCity < ApplicationRecord
  require 'csv'

  def self.importar(file)

    i = 0

    @dataprincipal= Array.new #el arreglo a guardar en la tabla university_cities
    @dictionary = Array.new #el arreglo a guardar en la tabla dictionary_objetives
    alldictionary = DictUnivCity.all #trae todo el diccionario de datos objetivos
    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataprincipal = [:city, :answer_year, :response, :dict_univ_city_id] #columnas de la tabla university_cities
    lastdataprincip = UniversityCity.last() #busco el ultimo registro en la tabla university_cities

    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        encabezado = row[0].try(:split, ",") || "no tiene"
        if lastdataprincip.blank?

        else
          #entra aqui si ya hay al menos un registro en data_objetives, y guardo el ultimo id insertado en "i"
          i = lastdataprincip.id

        end

      else
        contcabecera=0
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        fila = row[0].try(:split, ",") || "no tiene"

        if fila != "no tiene"

          #recorro el encabezado que tiene las preguntas
          encabezado.each do |cebecera|

            @dictionary = ""

            if cebecera.strip != "0" && cebecera.strip != "Ciudad" && cebecera.strip != "ciudad" &&
                cebecera.strip != "AÃ±o" && cebecera.strip != "ano" &&
                cebecera.strip != "Ano" && cebecera != "Anio" && cebecera.strip != nil && cebecera.strip != "CIUDAD"


              if alldictionary.empty?
                ##entra aqui si no hay ningun dato en questions, y guardo una
                @dictionary = DictUnivCity.new
                @dictionary.name = cebecera.strip
                @dictionary.save!
              else
                ##entra aqui si ya hay pregutas guardadas
                # y recorro allquestions
                alldictionary.each do |filaquestion|
                  ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                  if filaquestion.name == cebecera.strip
                    @dictionary = filaquestion
                    break
                  end
                end

                ##aqui valido si no consiguio nada arriba en el each, entonces creo una nueva pregunta
                if @dictionary == ""
                  @dictionary = DictUnivCity.new
                  @dictionary.name = cebecera.strip
                  @dictionary.save!
                  alldictionary = DictUnivCity.all
                end
              end


              if fila[contcabecera] != nil && fila[contcabecera].strip != "#!NULO!" && fila[contcabecera].strip != "#¡NULO" &&
                  fila[contcabecera].strip != "#¡NULO!" &&
                  fila[contcabecera].strip != "#!NULO¡" &&
                  fila[contcabecera].strip!= ""
                #almaceno la respuesta a la pregunta

                @dataprincipal << {
                    :city => fila[0].strip,
                    :answer_year => fila[1].strip,
                    :response=> fila[contcabecera].strip,
                    :dict_univ_city_id=>@dictionary.id
                }
              end
            end

            contcabecera = contcabecera + 1
          end
        end
      end

      i = i + 1
    end
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    UniversityCity.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
