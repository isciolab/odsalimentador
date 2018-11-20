class PersonHasQuestion < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.importar(file)

    i = 0
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    @personhasquestion = Array.new
    @person = Array.new

    encabezado = Array.new
    contcabecera = 0
    columnspeople = [:stratum, :sex, :city, :age,:answer_year,:unique_id,:location,:zone,:id]
    columnspersonhasq = [:answer, :people_id, :question_id]
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      if i == 0
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
      i = i + 1
    end
    Person.import columnspeople, @person, validate: false
    PersonHasQuestion.import columnspersonhasq, @personhasquestion, validate:false
  end

end
