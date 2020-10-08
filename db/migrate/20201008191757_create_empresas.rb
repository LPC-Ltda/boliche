class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.string :rut
      t.string :razon_social
      t.string :estado
      t.string :creado_por
      t.string :actualizado_por

      t.timestamps
    end
  end
end
