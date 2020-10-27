class RemoveEmpresaIdFromRoles < ActiveRecord::Migration[5.2]
  def change
  	remove_column :roles, :empresa_id
  end
end
