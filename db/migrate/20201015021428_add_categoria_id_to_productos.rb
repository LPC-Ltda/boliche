class AddCategoriaIdToProductos < ActiveRecord::Migration[5.2]
  def change
    add_column :productos, :categoria_id, :integer
    add_index :productos, :categoria_id
  end
end
