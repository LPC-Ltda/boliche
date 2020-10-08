class CreateRegistros < ActiveRecord::Migration[5.2]
  def change
    create_table :registros do |t|
      t.integer :cliente_id
      t.integer :empresa_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :registros, :cliente_id
    add_index :registros, :empresa_id
  end
end
