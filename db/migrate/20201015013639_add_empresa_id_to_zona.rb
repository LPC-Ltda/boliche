class AddEmpresaIdToZona < ActiveRecord::Migration[5.2]
  def change
    add_column :zonas, :empresa_id, :integer
    add_index :zonas, :empresa_id
  end
end
