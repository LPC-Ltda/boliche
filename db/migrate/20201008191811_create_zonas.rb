class CreateZonas < ActiveRecord::Migration[5.2]
  def change
    create_table :zonas do |t|
      t.string :zona
      t.string :tarifa
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
  end
end
