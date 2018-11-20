
class Theme < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.import(file)
    arreglo=[]
    i=0
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    @tema=Array.new
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      i=i+1
      @tema << {
          :name => row[0],
          :description => row[1]
      }
    end

    Theme.create(@tema)
  end

end
