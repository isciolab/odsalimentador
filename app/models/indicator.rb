class Indicator < ApplicationRecord
  require 'csv'
  validates :name, presence: true, uniqueness: true
  validates :target_id, presence: true
  validates :number, presence: true, uniqueness: true
  belongs_to :target
  has_many :indicator_values

  def self.import(file)
    ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
    # hace el explode en php
    CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      if row[0].present?
        target = Target.find_by number: row[1]
        if target
          puts target.inspect
          Indicator.create([{number: row[2], name: row[3], available: 1, target_id: target.id}])
        end
      end
    end
  end

end
