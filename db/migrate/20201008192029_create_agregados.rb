class CreateAgregados < ActiveRecord::Migration[5.2]
  def change
    create_table :agregados do |t|
      t.integer :adicional_id
      t.integer :detalle_pedido_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :agregados, :adicional_id
    add_index :agregados, :detalle_pedido_id
  end
end
