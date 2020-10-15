class CreateCategorias < ActiveRecord::Migration[5.2]
  def change
    create_table :categorias do |t|
      t.string :categoria
      t.integer :empresa_id

      t.timestamps
    end
    add_index :categorias, :empresa_id
  end
end
