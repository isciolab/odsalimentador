class PersonHasQuestion < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.import(file)
    arreglo = []
    i = 0
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    @personhasquestion = Array.new
    @person = Array.new

    encabezado = Array.new
    contcabecera = 0
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      i = i + 1

      if i == 1
        encabezado = row
      else
        @person << {
            :stratum => row[1],
            :sex => row[5],
            :city => row[2],
            :age => row[6],
            :answer_year => row[7],
            :unique_id => row[0],
            :location => row[3],
            :zone => row[4],
            :id => i
        }

        encabezado.each do |cebecera|

          if contcabecera>7
            @question =Question.where(name: cebecera)
            question_id= @question
            if @question.empty?
              @question = Question.new
              @question.name=cebecera
              @question.available=1
              @question.save!
              question_id= @question
            end

            if cebecera!="#!NULO!" && cebecera!="#¡NULO" && cebecera!="#¡NULO!" && cebecera!="#!NULO¡"

              @personhasquestion << {
                  :answer => row[contcabecera],
                  :people_id => i,
                  :question_id => question_id,
              }
            end

          end

          contcabecera = contcabecera + 1
        end
      end
    end
    Person.create(@person)
    PersonHasQuestion.create(@personhasquestion)
  end

end
