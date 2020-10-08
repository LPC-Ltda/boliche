class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.datetime :hora_pedido
      t.datetime :hora_entrega
      t.text :observacion
      t.integer :registro_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :pedidos, :registro_id
  end
end
