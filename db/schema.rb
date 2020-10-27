# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_26_213531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adicionales", force: :cascade do |t|
    t.string "adicional"
    t.decimal "precio"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "agregados", force: :cascade do |t|
    t.integer "adicional_id"
    t.integer "detalle_pedido_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adicional_id"], name: "index_agregados_on_adicional_id"
    t.index ["detalle_pedido_id"], name: "index_agregados_on_detalle_pedido_id"
  end

  create_table "categorias", force: :cascade do |t|
    t.string "categoria"
    t.integer "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.index ["empresa_id"], name: "index_categorias_on_empresa_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "direccion"
    t.string "telefono"
    t.integer "zona_id"
    t.integer "usuario_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_clientes_on_usuario_id"
    t.index ["zona_id"], name: "index_clientes_on_zona_id"
  end

  create_table "detalle_pedidos", force: :cascade do |t|
    t.integer "cantidad"
    t.text "observacion"
    t.integer "pedido_id"
    t.integer "producto_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_detalle_pedidos_on_pedido_id"
    t.index ["producto_id"], name: "index_detalle_pedidos_on_producto_id"
  end

  create_table "empleados", force: :cascade do |t|
    t.string "rut"
    t.string "nombre"
    t.string "apellido_paterno"
    t.string "apellido_materno"
    t.string "rol"
    t.string "email"
    t.integer "rol_id"
    t.integer "empresa_id"
    t.integer "usuario_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_empleados_on_empresa_id"
    t.index ["rol_id"], name: "index_empleados_on_rol_id"
    t.index ["usuario_id"], name: "index_empleados_on_usuario_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "rut"
    t.string "razon_social"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "hora_pedido"
    t.datetime "hora_entrega"
    t.text "observacion"
    t.integer "registro_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registro_id"], name: "index_pedidos_on_registro_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "producto"
    t.string "disponibilidad"
    t.integer "demora_minutos"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id"
    t.integer "categoria_id"
    t.index ["categoria_id"], name: "index_productos_on_categoria_id"
    t.index ["empresa_id"], name: "index_productos_on_empresa_id"
  end

  create_table "registros", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "empresa_id"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_registros_on_cliente_id"
    t.index ["empresa_id"], name: "index_registros_on_empresa_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "rol"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  create_table "zonas", force: :cascade do |t|
    t.string "zona"
    t.string "tarifa"
    t.string "estado"
    t.string "creado_por"
    t.string "actualizado_por"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id"
    t.index ["empresa_id"], name: "index_zonas_on_empresa_id"
  end

end
