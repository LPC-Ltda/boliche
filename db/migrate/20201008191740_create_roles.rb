class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :rol
      t.integer :empresa_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :roles, :empresa_id
  end
end
