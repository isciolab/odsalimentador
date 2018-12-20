class Indicator < ApplicationRecord
  require 'csv'

  belongs_to :target, optional:true
  has_many :indicator_values

  def self.import(file)
        ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
        # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      if row[0].present?
        target = Target.find_by number: row[1]
        if target
          puts target.inspect
          @measure = Measure.find_by name: row[5]

          if @measure

          else
            @measure=Measure.new
            @measure.name=row[5]
            @measure.save
          end
          measure=nil
          if @measure.id
            measure=@measure.id
          end

          Indicator.create([{number: row[2], name: row[3], available: 1,
                             target_id: target.id,measure_id:3}])
        end
      end
    end
  end

  def self.load_descripcion(file)
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      if row[0].present?
          @indicator = Indicator.find_by number: row[2]
          if @indicator

            @indicator.trazador_conpes=row[4]

            @indicator.year_national_base_line=2015
            @indicator.national_base_line=row[6]

            @indicator.national_goal=row[8]
            @indicator.year_national_goal=2030

            @indicator.reference_value_low=row[16]
            @indicator.reference_value_mid=row[17]
            @indicator.reference_value_high=row[18]

            if row[4]=="X"
            @indicator.trazador_goal=1
            end


            @indicator.save

          else
            target = Target.find_by number: row[1]
            if target
              @indicator=Indicator.new
              @indicator.name=row[3]
              @indicator.available=1
              @indicator.number=row[2]
              @indicator.save
            end

          end


      end
    end
  end

end
