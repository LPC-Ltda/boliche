class AddFieldsToCategoria < ActiveRecord::Migration[5.2]
  def change
    add_column :categorias, :estado, :string
    add_column :categorias, :creado_por, :string
    add_column :categorias, :actualizado_por, :string
  end
end
