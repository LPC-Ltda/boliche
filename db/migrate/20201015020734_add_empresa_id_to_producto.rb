class AddEmpresaIdToProducto < ActiveRecord::Migration[5.2]
  def change
    add_column :productos, :empresa_id, :integer
    add_index :productos, :empresa_id
  end
end
