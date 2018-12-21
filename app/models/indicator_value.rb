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

    @cabecera = Array.new()
    contadordespues = 0;
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |fila|
      contadordespues = 0;
      if i == 0
        #si entra aqui, entra con las dos primeras filas, por lo tanto las recorro debajo

        controwdosfilas = 0
        contprimerasdos = 0
        fila.each do |primerasdosfilas|

          controwdosfilas = 0
          primerasdosfilas.each do |rowdosfilas|

            ##solo entro en el segundo item, que es la segunda fila
            if controwdosfilas == 1

              if rowdosfilas.nil?

              else
                cantidadpuntos = contarlength(rowdosfilas, ".")
                if cantidadpuntos > 1

                  @cabecera = @cabecera << {
                      :indicador => rowdosfilas,
                      :columna => contprimerasdos,
                  }
                end
              end
            end

            controwdosfilas = controwdosfilas + 1

          end


          contprimerasdos = contprimerasdos + 1
        end


      else
        ##aqui entra en la tercera fila en adelante


        fila.each do |primerasdosfilas|
          indicador = ""

          @cabecera.each do |row|

            if row[:columna] == contadordespues
              indicador = row
            end

          end

          if indicador != ""

            @indicator = Indicator.find_by number: indicador[:indicador]
            @city = City.select("cities.*, upper(name) as name").where(name: fila[0].upcase)

            if @indicator.nil?

            else

              if @city.exists?
                @city.each do |filagrupo|
                  ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                  @city = filagrupo
                end

                @indicator_value = IndicatorValue.find_by(indicator_id: indicador[:indicador],
                                                          date_from: fila[2],city_id:@city.id)
                score=nil
                if !fila[indicador[:columna]].nil? && !fila[indicador[:columna]].empty?
                  score=fila[indicador[:columna]].gsub! ',', '.'

                else

                end

                if @indicator_value.nil?

                  IndicatorValue.create([{score: score, date_from: fila[2],date_to:fila[2],
                                          indicator_id: @indicator.id,city_id:@city.id}])
                else
                  @indicador_value=IndicatorValue.new
                  @indicador_value.score = score
                  @indicador_value.date_from = fila[2]
                  @indicador_value.date_to = fila[2]
                  @indicador_value.indicator_id = @indicator.id
                  @indicador_value.city_id = @city.id
                  @indicator.save
                end


              end


            end

          end
          contadordespues = contadordespues + 1
        end

      end

      i = i + 1
    end

    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    #City.import columnsdataprincipal, @dataprincipal, validate: false
  end
end
