class CreateEmpleados < ActiveRecord::Migration[5.2]
  def change
    create_table :empleados do |t|
      t.string :rut
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rol
      t.string :email
      t.integer :rol_id
      t.integer :empresa_id
      t.integer :usuario_id
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
    add_index :empleados, :rol_id
    add_index :empleados, :empresa_id
    add_index :empleados, :usuario_id
  end
end
