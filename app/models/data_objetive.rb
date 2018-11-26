class DataObjetive < ApplicationRecord
  require 'csv'

  def self.importar(file)

    i = 0

    @dataobjetive = Array.new #el arreglo a guardar en la tabla data_objetives
    @question = Array.new #el arreglo a guardar en la tabla dictionary_objetives
    allquestions = DictionaryObjetive.all #trae todo el diccionario de datos objetivos
    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataobjetive = [:city, :answer_year, :response, :dictionary_objetive_id] #columnas de la tabla data_objetives
    lastpeople = DictionaryObjetive.last() #busco el ultimo registro en la tabla data_objetives

    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        encabezado = row[0].try(:split, ",") || "no tiene"
        if lastpeople.blank?

        else
          #entra aqui si ya hay al menos un registro en data_objetives, y guardo el ultimo id insertado en "i"
          i = lastpeople.id

        end

      else
        contcabecera=0
        # aqui la data viene en una sola fila, en una sola columna, por lo tando le hago un split y las separo
        fila = row[0].try(:split, ",") || "no tiene"

        if fila != "no tiene"

          #recorro el encabezado que tiene las preguntas
          encabezado.each do |cebecera|

            @dicctionary = ""

            if cebecera.strip != "0" && cebecera.strip != "Ciudad" && cebecera.strip != "AÃ±o" && cebecera.strip != "SEXO" &&
                cebecera.strip != "EDAD" && cebecera != "AÑO" && cebecera.strip != "ZONAS" && cebecera.strip != nil && cebecera.strip != "CIUDAD"


              if allquestions.empty?
                ##entra aqui si no hay ningun dato en questions, y guardo una
                @dicctionary = DictionaryObjetive.new
                @dicctionary.name = cebecera.strip
                @dicctionary.save!
              else
                ##entra aqui si ya hay pregutas guardadas
                # y recorro allquestions
                allquestions.each do |filaquestion|
                  ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                  if filaquestion.name == cebecera.strip
                    @dicctionary = filaquestion
                    break
                  end
                end

                ##aqui valido si no consiguio nada arriba en el each, entonces creo una nueva pregunta
                if @dicctionary == ""
                  @dicctionary = DictionaryObjetive.new
                  @dicctionary.name = cebecera.strip
                  @dicctionary.save!
                  allquestions = DictionaryObjetive.all
                end
              end


                if fila[contcabecera] != nil && fila[contcabecera].strip != "#!NULO!" && fila[contcabecera].strip != "#¡NULO" &&
                    fila[contcabecera].strip != "#¡NULO!" &&
                    fila[contcabecera].strip != "#!NULO¡" &&
                    fila[contcabecera].strip!= ""
                  #almaceno la respuesta a la pregunta

                  @dataobjetive << {
                      :city => fila[0].strip,
                      :answer_year => fila[1].strip,
                      :response=> fila[contcabecera].strip,
                      :dictionary_objetive_id=>@dicctionary.id
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
    DataObjetive.import columnsdataobjetive, @dataobjetive, validate: false
  end
end
