class Goal < ApplicationRecord
    require 'csv'
    validates :name, presence: true
    validates :number, presence: true, uniqueness: true,:if=> 'self.changed?'
    has_many  :targets

    mount_uploader :avatar, AvatarUploader ##esto subira la imagen

    ##esta funcion, guarda los datos en la tabla goals, para almacenas las ods por archivo csv
    def self.import(file)
        i=0
        ##el parametro col_sep de la siguiente linea, lo que hace es decirle como va a separar las filas y es como si
        # hace el explode en php
        CSV.foreach(file.path, col_sep: ';', headers: true, encoding: 'iso-8859-1:utf-8') do |row|
            i=i+1
            Goal.create([{number: i, name: row[2],description:row[1]}])
        end
    end
end
