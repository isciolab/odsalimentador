class Target < ApplicationRecord
  require 'csv'

  validates :goal_id, :presence => true
  validates :number, presence: true, uniqueness: true
  belongs_to :goal
  has_many :indicators

  def self.import(file)
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      ##en la siguiente linea, le digo que a la columna 0 de la primera fila, que es el numero de la meta
      # que busque desde el caracter 0 hasta donde encuentre un ., ya que a partir del punto en adelante, es el numero de la meta
      # y del punto hacia atras, es el numero del ODS
      ##goal= Goal.find_by number: row[0][0,row[0].index('.')]
      if row[0].present?
        @target = ""
        goal = ""
        goal = Goal.find_by number: row[0]
        @target = Target.find_by number: row[0] + "." + row[1]
        if goal
          puts "fernando"
          puts goal.id
          puts row[0] + "." + row[1]

          if @target
            @target.number = row[0] + "." + row[1]
            @target.name = row[3]
            @target.description = row[2]
            @target.goal_id = goal.id
            @target.available = 1
            puts "entro a actualizar"
            puts @target.save

          else
            puts "entro a crear"
            puts row[3]
            name = ""
            if row[3] != nil && row[3].strip != ""
              name = row[3]
            else
              name = row[2]
            end

            Target.create([{number: row[0] + "." + row[1], name: name, available: 1,
                            description: row[2], goal_id: goal.id}])
          end

        end
      end
    end
  end

  ##este metodo concatena el numero de la meta con el nombre, para ser invocado mas que todo en los select de metas
  def numbername
    self.number + " - " + self.name
  end
end
