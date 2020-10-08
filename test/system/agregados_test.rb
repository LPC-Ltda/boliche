require "application_system_test_case"

class AgregadosTest < ApplicationSystemTestCase
  setup do
    @agregado = agregados(:one)
  end

  test "visiting the index" do
    visit agregados_url
    assert_selector "h1", text: "Agregados"
  end

  test "creating a Agregado" do
    visit agregados_url
    click_on "New Agregado"

    fill_in "Actualizado por", with: @agregado.actualizado_por
    fill_in "Adicional", with: @agregado.adicional_id
    fill_in "Creado por", with: @agregado.creado_por
    fill_in "Detalle pedido", with: @agregado.detalle_pedido_id
    fill_in "Estado", with: @agregado.estado
    click_on "Create Agregado"

    assert_text "Agregado was successfully created"
    click_on "Back"
  end

  test "updating a Agregado" do
    visit agregados_url
    click_on "Edit", match: :first

    fill_in "Actualizado por", with: @agregado.actualizado_por
    fill_in "Adicional", with: @agregado.adicional_id
    fill_in "Creado por", with: @agregado.creado_por
    fill_in "Detalle pedido", with: @agregado.detalle_pedido_id
    fill_in "Estado", with: @agregado.estado
    click_on "Update Agregado"

    assert_text "Agregado was successfully updated"
    click_on "Back"
  end

  test "destroying a Agregado" do
    visit agregados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agregado was successfully destroyed"
  end
end
