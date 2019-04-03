class PersonHasQuestion < ApplicationRecord
  require 'csv'

  ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
  def self.importar(file)

    i = 0

    @personhasquestion = Array.new #el arreglo a guardar en la tabla person_has_questions
    @person = Array.new #el arreglo a guardar en la tabla person
    @question=Array.new #el arreglo a guardar en la tabla question
    allquestions=Question.all #almacena todas las questions
    encabezado = Array.new #almacena el encabezado de los archivos csv, que es donde estaran los nombres de las preguntas

    columnspeople = [:stratum, :sex, :city, :age,:answer_year,:unique_id,:location,:zone,:id] #columnas de la tabla people
    columnspersonhasq = [:answer, :people_id, :question_id] #columnas de la tabla person_has_questions
    lastpeople=People.last() #busco el ultimo registro en la tabla people

    ##el parametro co
    # l_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: false, encoding: 'iso-8859-1:utf-8') do |row|

      if i == 0
        #si entra aqui, guardo el encabezado una sola vez
        encabezado = row
        if lastpeople.blank?

        else
          #entra aqui si ya hay al menos un registro en peoples, y guardo el ultimo id insertado en "i"
          i=lastpeople.id

        end

      else
        ##esto va almacenando en @person los datos a guardar
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

        #recorro el encabezado que tiene las preguntas
        encabezado.each do |cebecera|

          @question=""

          if cebecera.strip!="0" && cebecera.strip!="NSE" && cebecera.strip!="LOCALIDAD_COMUNA" && cebecera.strip!="SEXO" &&
              cebecera.strip!="EDAD" && cebecera!="AÑO" && cebecera.strip!="ZONAS" && cebecera.strip!=nil && cebecera.strip!="CIUDAD"


            if allquestions.empty?
              ##entra aqui si no hay ningun dato en questions, y guardo una
                @question = Question.new
                @question.name=cebecera.strip
                @question.available=1
                @question.save!
            else
              ##entra aqui si ya hay pregutas guardadas
              # y recorro allquestions
              allquestions.each do |filaquestion|
                ##pregunto si la pregunta que estoy recorriendo == a la pregunta de la cabecera
                if filaquestion.name==cebecera.strip
                  @question=filaquestion
                  break
                end
              end

              ##aqui valido si no consiguio nada arriba en el each, entonces creo una nueva pregunta
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
              #almaceno la respuesta a la pregunta
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
    ##aqui guardo los arreglos, usando esta gema  "activerecord-import"
    Person.import columnspeople, @person, validate: false
    PersonHasQuestion.import columnspersonhasq, @personhasquestion, validate:false
  end

end
