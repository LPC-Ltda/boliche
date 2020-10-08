require "application_system_test_case"

class DetallePedidosTest < ApplicationSystemTestCase
  setup do
    @detalle_pedido = detalle_pedidos(:one)
  end

  test "visiting the index" do
    visit detalle_pedidos_url
    assert_selector "h1", text: "Detalle Pedidos"
  end

  test "creating a Detalle pedido" do
    visit detalle_pedidos_url
    click_on "New Detalle Pedido"

    fill_in "Actualizado por", with: @detalle_pedido.actualizado_por
    fill_in "Cantidad", with: @detalle_pedido.cantidad
    fill_in "Creado por", with: @detalle_pedido.creado_por
    fill_in "Estado", with: @detalle_pedido.estado
    fill_in "Observacion", with: @detalle_pedido.observacion
    fill_in "Pedido", with: @detalle_pedido.pedido_id
    fill_in "Producto", with: @detalle_pedido.producto_id
    click_on "Create Detalle pedido"

    assert_text "Detalle pedido was successfully created"
    click_on "Back"
  end

  test "updating a Detalle pedido" do
    visit detalle_pedidos_url
    click_on "Edit", match: :first

    fill_in "Actualizado por", with: @detalle_pedido.actualizado_por
    fill_in "Cantidad", with: @detalle_pedido.cantidad
    fill_in "Creado por", with: @detalle_pedido.creado_por
    fill_in "Estado", with: @detalle_pedido.estado
    fill_in "Observacion", with: @detalle_pedido.observacion
    fill_in "Pedido", with: @detalle_pedido.pedido_id
    fill_in "Producto", with: @detalle_pedido.producto_id
    click_on "Update Detalle pedido"

    assert_text "Detalle pedido was successfully updated"
    click_on "Back"
  end

  test "destroying a Detalle pedido" do
    visit detalle_pedidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Detalle pedido was successfully destroyed"
  end
end
