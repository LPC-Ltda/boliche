class CreateDetallePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :detalle_pedidos do |t|
      t.integer :cantidad
      t.text :observacion
      t.integer :pedido_id
      t.integer :producto_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :detalle_pedidos, :pedido_id
    add_index :detalle_pedidos, :producto_id
  end
end
