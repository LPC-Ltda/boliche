class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :email
      t.string :direccion
      t.string :telefono
      t.integer :zona_id
      t.integer :usuario_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :clientes, :zona_id
    add_index :clientes, :usuario_id
  end
end
