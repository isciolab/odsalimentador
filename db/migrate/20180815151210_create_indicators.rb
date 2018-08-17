class CreateIndicators < ActiveRecord::Migration[5.1]
  def change
    create_table :indicators do |t|
      t.string :number
      t.string :name
      t.text :description
      t.string :data_type
      t.string :national_base_line
      t.string :year_national_base_line #anio parametrizable de la linea base
      t.string :national_goal
      t.string :year_national_goal #anio parametrizable de la meta o ODS
      t.string :reference_value_low
      t.string :reference_value_mid
      t.string :reference_value_high
      t.string :trazador_conpes
      t.boolean :available
      t.string :institutional_inf
      t.string :methodological_proposal
      t.text :comment


      t.timestamps
    end
  end
end
