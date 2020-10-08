require "application_system_test_case"

class AdicionalesTest < ApplicationSystemTestCase
  setup do
    @adicional = adicionales(:one)
  end

  test "visiting the index" do
    visit adicionales_url
    assert_selector "h1", text: "Adicionales"
  end

  test "creating a Adicional" do
    visit adicionales_url
    click_on "New Adicional"

    fill_in "Actualizado por", with: @adicional.actualizado_por
    fill_in "Adicional", with: @adicional.adicional
    fill_in "Creado por", with: @adicional.creado_por
    fill_in "Estado", with: @adicional.estado
    fill_in "Precio", with: @adicional.precio
    click_on "Create Adicional"

    assert_text "Adicional was successfully created"
    click_on "Back"
  end

  test "updating a Adicional" do
    visit adicionales_url
    click_on "Edit", match: :first

    fill_in "Actualizado por", with: @adicional.actualizado_por
    fill_in "Adicional", with: @adicional.adicional
    fill_in "Creado por", with: @adicional.creado_por
    fill_in "Estado", with: @adicional.estado
    fill_in "Precio", with: @adicional.precio
    click_on "Update Adicional"

    assert_text "Adicional was successfully updated"
    click_on "Back"
  end

  test "destroying a Adicional" do
    visit adicionales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adicional was successfully destroyed"
  end
end
