class CreateAdicionales < ActiveRecord::Migration[5.2]
  def change
    create_table :adicionales do |t|
      t.string :adicional
      t.decimal :precio
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
  end
end
