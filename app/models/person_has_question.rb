class PersonHasQuestion < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.importar(file)

    i = 0
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    @personhasquestion = Array.new
    @person = Array.new
    allquestions=Question.all
    @question=Array.new

    encabezado = Array.new
    contcabecera = 0
    columnspeople = [:stratum, :sex, :city, :age,:answer_year,:unique_id,:location,:zone,:id]
    columnspersonhasq = [:answer, :people_id, :question_id]
    lastpeople=People.last()

    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      if i == 0
        encabezado = row
        if lastpeople.blank?

        else

          i=lastpeople.id+1

        end

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
        contcabecera=0
        encabezado.each do |cebecera|

          @question=""

          if cebecera.strip!="0" && cebecera.strip!="NSE" && cebecera.strip!="LOCALIDAD_COMUNA" && cebecera.strip!="SEXO" &&
              cebecera.strip!="EDAD" && cebecera!="AÑO" && cebecera.strip!="ZONAS" && cebecera.strip!=nil && cebecera.strip!="CIUDAD"


            if allquestions.empty?
                @question = Question.new
                @question.name=cebecera.strip
                @question.available=1
                @question.save!
            else
              allquestions.each do |filaquestion|
                if filaquestion.name==cebecera.strip
                  @question=filaquestion
                  break
                end
              end

              if @question==""
                @question = Question.new
                @question.name=cebecera.strip
                @question.available=1
                @question.save!
                allquestions=Question.all
              end
            end



            if row[contcabecera]!=nil && row[contcabecera].strip!="#!NULO!" && row[contcabecera].strip!="#¡NULO" && row[contcabecera].strip!="#¡NULO!" && row[contcabecera].strip!="#!NULO¡" &&
                row[contcabecera].strip!=""

              @personhasquestion << {
                  :answer => row[contcabecera].strip,
                  :people_id => i,
                  :question_id => @question.id,
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
