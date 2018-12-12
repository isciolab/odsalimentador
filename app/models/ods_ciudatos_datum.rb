class OdsCiudatosDatum < ApplicationRecord
  require 'csv'

  def self.importar(file)

    i = 0

    @dataprincipal= Array.new
    @dictionary = Array.new
    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataprincipal = [:objetive, :target, :indicator, :city, :response, :source, :symbol]
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


              puts fila.inspect
              if fila[contcabecera] != nil && fila[contcabecera].strip != "#!NULO!" && fila[contcabecera].strip != "#¡NULO" &&
                  fila[contcabecera]!= "" &&
                  fila[contcabecera].strip != "#¡NULO!" &&
                  fila[contcabecera].strip != "#!NULO¡" &&
                  fila[contcabecera].strip!= "" &&  fila[contcabecera].strip!= "NA" &&  fila[contcabecera].strip!= "na" &&
                  fila[contcabecera].strip!= "N/A" && fila[contcabecera].strip!="No Disponible"
                #almaceno la respuesta

                @dataprincipal << {
                    :objetive => fila[0],
                    :target => fila[1],
                    :indicator=> fila[2],
                    :city=>fila[3],
                    :response=>fila[4],
                    :source=>fila[5],
                    :symbol=>fila[6]
                }
            contcabecera = contcabecera + 1
          end

      end

      i = i + 1
    end
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    OdsCiudatosDatum.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
