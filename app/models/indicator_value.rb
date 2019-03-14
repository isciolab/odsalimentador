class IndicatorValue < ApplicationRecord
  belongs_to :indicator
  belongs_to :city
  require 'csv'

  def self.contarlength(string, substring)
    string.each_char.each_cons(substring.size).map(&:join).count(substring)
  end

  def self.importarConDosReferen(file)

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
                ##aqui verifico si el string que tiene el numero del indicador, tenga al menos 2 puntos
                # para poder determinar que sea un indicador
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

        #recorro la fila por la que estoy pasando
        fila.each do |primerasdosfilas|
          indicador = ""
          proximoindicador = ""

          contadorcabecera = 0;
          @cabecera.each do |row|
            ##aqui recorro la cabecera, para buscar el indice donde se almaceno algun idicador,
            # y tener el indicador sobre el cual voy a insertar
            if row[:columna] == contadordespues
              indicador = row
            end

            if @cabecera[contadorcabecera + 1]
              proximoindicador = @cabecera[contadorcabecera + 1]
            end

            contadorcabecera = contadorcabecera + 1
          end

          if indicador != ""

            ##busco el indicador que ya encontre arriba
            @indicator = Indicator.find_by number: indicador[:indicador]
            @city = City.select("cities.*, upper(name) as name").where(name: fila[0].upcase)

            if @indicator.nil?

            else

              if @city.exists?
                @city.each do |filagrupo|
                  ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                  @city = filagrupo
                end

                @indicator_value = IndicatorValue.find_by(indicator_id: @indicator.id,
                                                          date_from: fila[2], city_id: @city.id)

                score = nil
                if !fila[indicador[:columna]].nil? && !fila[indicador[:columna]].empty?
                  score = fila[indicador[:columna]].gsub! ',', '.'

                end

                meta = nil
                if proximoindicador != ""

                  if !fila[indicador[:columna] - 2].nil? && !fila[indicador[:columna] - 2].empty? &&
                      fila[indicador[:columna] - 2].to_f > 0.0
                    meta = fila[indicador[:columna] - 2].to_f
                  else
                    meta = fila[indicador[:columna] - 1].to_f
                  end
                else

                  if !fila[indicador[:columna] + 2].nil? && !fila[indicador[:columna] + 2].empty? &&
                      fila[indicador[:columna] + 2].to_f > 0.0
                    meta = fila[indicador[:columna] + 2].to_f
                  end

                end

                if !score.nil?

                  if @indicator_value.nil?

                    IndicatorValue.create([{score: score, date_from: fila[2], date_to: fila[2],
                                            indicator_id: @indicator.id, city_id: @city.id}])
                  else

                    if !meta.nil?

                      @indicator.year_national_goal = 2030
                      @indicator.national_goal = meta
                      @indicator.save
                    end

                    @indicator_value.score = score
                    @indicator_value.date_from = fila[2]
                    @indicator_value.date_to = fila[2]
                    @indicator_value.indicator_id = @indicator.id
                    @indicator_value.city_id = @city.id
                    @indicator_value.save
                  end
                end
              end
            end
          end
          contadordespues = contadordespues + 1
        end

      end

      i = i + 1
    end

  end


  def self.importarConTresReferen(file)

    i = 0

    @dataprincipal = Array.new

    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php

    @cabecera = Array.new()
    contadordespues = 0
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |fila|
      contadordespues = 0


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
                ##aqui verifico si el string que tiene el numero del indicador, tenga al menos 2 puntos
                # para poder determinar que sea un indicador
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

        contadorcolumna=0
        #recorro la fila por la que estoy pasando
        fila.each do |primerasdosfilas|
          indicador = ""
          proximoindicador = ""

          contadorcabecera = 0;
          @cabecera.each do |row|
            ##aqui recorro la cabecera, para buscar el indice donde se almaceno algun idicador,
            # y tener el indicador sobre el cual voy a insertar
            if row[:columna] == contadordespues
              indicador = row
            end

            if @cabecera[contadorcabecera + 1]
              proximoindicador = @cabecera[contadorcabecera + 1]
            end

            contadorcabecera = contadorcabecera + 1
          end

          if indicador != ""

            ##busco el indicador que ya encontre arriba
            @indicator = Indicator.find_by number: indicador[:indicador]
            @city = City.select("cities.*, upper(name) as name").where(name: fila[0].upcase)

            if @indicator.nil?

            else

              if @city.exists?
                @city.each do |filagrupo|
                  ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                  @city = filagrupo
                end

                @indicator_value = IndicatorValue.find_by(indicator_id: @indicator.id,
                                                          date_from: fila[3], city_id: @city.id)

                @groupcity = GroupCity.select("group_cities.*, upper(name) as name").where(name: fila[2].upcase)
                if @groupcity.exists?

                else

                  @groupcity = GroupCity.select("group_cities.*").where(name: fila[2])
                  if @groupcity.exists?
                  else
                    puts "no existe grupo"
                    GroupCity.create([{name: fila[2].upcase}])
                  end
                end

                @groupcity = GroupCity.find_by(name: fila[2].upcase)


                @ref_indicator_values = RefIndicatorValue.find_by(indicator_id: @indicator.id,
                                                                  group_city_id: @groupcity.id)

                score = nil
                if !fila[indicador[:columna]].nil? && !fila[indicador[:columna]].empty?
                  score = fila[indicador[:columna]].gsub! ',', '.'

                end

                referenceone = 0
                referencetwo = 0
                meta = nil


                if proximoindicador != ""

                  puts "entra aqui cuando exista un proximo indicador"
                  puts "referenceone"
                  puts referenceone
                  puts "referencetwo"
                  puts referencetwo

                  if !fila[indicador[:columna] + 5].nil? && !fila[indicador[:columna] + 5].empty?
                    if !fila[indicador[:columna] + 5].index(",").nil?
                      referenceone = fila[indicador[:columna] + 5].gsub! ',', '.'
                    else
                      referenceone=fila[indicador[:columna] + 5]
                    end
                  end

                  if !fila[indicador[:columna] + 4].nil? && !fila[indicador[:columna] + 4].empty?

                    if !fila[indicador[:columna] + 4].index(",").nil?
                      referencetwo = fila[indicador[:columna] + 4].gsub! ',', '.'
                    else
                      referencetwo=fila[indicador[:columna] + 4]
                    end
                  end
                else


                  puts "proximoindicador"
                  puts proximoindicador
                  puts "fila[indicador[:columna] - 1]"
                  puts fila[indicador[:columna] - 1]
                  puts "fila[indicador[:columna] - 2]"
                  puts fila[indicador[:columna] - 2]
                  puts fila[indicador[:columna]]

                  ##entra aqui si existe un proximo indicador en la fila

                  #fila[indicador[:columna] - 1].nil es igual a la referencia3
                  ##pregunto entonces si referencia3 != null, guardo la referencia 2 como refere 1 y la ref 3 como la 2
                  if !fila[indicador[:columna] - 1].nil? && fila[indicador[:columna] - 1] != "" &&
                      fila[indicador[:columna] - 1].to_f >= 0
                    puts "paso en la primera"
                    referenceone = fila[indicador[:columna] - 2].gsub! ',', '.'
                    referencetwo = fila[indicador[:columna] - 1].gsub! ',', '.'
                    meta = fila[indicador[:columna] - 2].to_f

                  else
                    meta = fila[indicador[:columna] - 2].to_f
                    puts "paso en la segunda"
                    #fila[indicador[:columna] - 3] = a la columna referencia 1.
                    if !fila[indicador[:columna] - 2].nil? && fila[indicador[:columna] - 2] != ""
                      referencetwo = fila[indicador[:columna] - 2].gsub! ',', '.'
                    end
                    ##en este caso, la referencia 2 siempre es la columa referencia 2 = fila[indicador[:columna] - 2]
                    if !fila[indicador[:columna] - 3].nil? && fila[indicador[:columna] - 3] != "" &&
                        fila[indicador[:columna] - 3].to_f >= 0

                      referenceone = fila[indicador[:columna] - 3].gsub! ',', '.'

                    end

                  end
                end

                puts 'contadorcolumna'
                puts contadorcolumna
                puts "fila[indicador[:columna]]"
                puts indicador[:columna]
                if contadorcolumna == indicador[:columna]
                  puts "proximoindicador"
                  puts proximoindicador
                  puts "fila[indicador[:columna] - 1]"
                  puts fila[indicador[:columna] - 1]
                  puts "fila[indicador[:columna] - 2]"
                  puts fila[indicador[:columna] - 2]
                  puts fila[indicador[:columna]]
                  puts referenceone
                  puts referencetwo

                  if !@ref_indicator_values.nil?
                    @ref_indicator_values.referenceone = referenceone
                    @ref_indicator_values.referencetwo = referencetwo
                    @ref_indicator_values.save

                  else


                     RefIndicatorValue.create([{indicator_id: @indicator.id,
                                                    group_city_id: @groupcity.id, referenceone: referenceone,
                                                    referencetwo: referencetwo}])

                  end
                end

                if !score.nil?

                  if @indicator_value.nil?

                    IndicatorValue.create([{score: score, date_from: fila[3], date_to: fila[3],
                                            indicator_id: @indicator.id, city_id: @city.id}])
                  else


                    @indicator_value.score = score
                    @indicator_value.date_from = fila[3]
                    @indicator_value.date_to = fila[3]
                    @indicator_value.indicator_id = @indicator.id
                    @indicator_value.city_id = @city.id
                    @indicator_value.save
                  end
                end
              end
            end
          end
          contadordespues = contadordespues + 1
          contadorcolumna=contadorcolumna+1
        end

      end
      i = i + 1
    end #end foreach

  end #end metodo
end #end clase
