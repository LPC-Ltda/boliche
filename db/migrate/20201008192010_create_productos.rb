class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :producto
      t.string :disponibilidad
      t.integer :demora_minutos
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
  end
end
