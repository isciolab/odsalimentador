class IndicatorValue < ApplicationRecord
  belongs_to :indicator
  belongs_to :city
  require 'csv'

  def self.contarlength(string, substring)
    string.each_char.each_cons(substring.size).map(&:join).count(substring)
  end

  def self.importar(file)

    i = 0

    @dataprincipal = Array.new

    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnsdataprincipal = [:name, :group_cities_id, :is_capital, :goal_group_id, :rccv_program, :total_population,
                            :metropolitan_area, :city_system_dnp, :dnp_category, :ddt_typology, :department_id, :description,
                            :urban_population, :rural_population, :total_area, :foundation_year]
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php

    cabecera=[]
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |fila|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        puts "fila"
        puts fila

        controwdosfilas=0
        contprimerasdos=0
        fila.each do |primerasdosfilas|

          controwdosfilas=0
          primerasdosfilas.each do |rowdosfilas|

            if controwdosfilas==1

              if rowdosfilas.nil?

              else
                cantidadpuntos=contarlength(rowdosfilas,".")
                if cantidadpuntos>1
                  puts rowdosfilas
                  articles << Article.new(:indicador => rowdosfilas, :columna=>contprimerasdos)
                end
              end
            end

            controwdosfilas=controwdosfilas+1

          end

          puts contprimerasdos
          contprimerasdos=contprimerasdos+1
        end


      else


      end

      i = i + 1
    end
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    #City.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
