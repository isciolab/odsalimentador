class DictionaryObjetive < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.importar(file)
    i = 0
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    @dictionary = Array.new
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|

      fila =row[0].try(:split, ",") || "no tiene"

      if fila!="no tiene"
        @dictionary << {
            :name => fila[0].nil? ? nil :fila[0].force_encoding('utf-8') ,
            :description => fila[1].nil? ? nil :fila[1].force_encoding('utf-8') ,
            :source => fila[3].nil? ? nil :fila[3].force_encoding('utf-8'),
            :measure => fila[5].nil? ? nil :fila[5].force_encoding('utf-8'),
            :ctype => fila[6].nil? ? nil :fila[6].force_encoding('utf-8')

        }
        end

      i = i + 1
    end

    DictionaryObjetive.create(@dictionary)
  end

end
