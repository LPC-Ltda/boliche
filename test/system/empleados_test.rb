require "application_system_test_case"

class EmpleadosTest < ApplicationSystemTestCase
  setup do
    @empleado = empleados(:one)
  end

  test "visiting the index" do
    visit empleados_url
    assert_selector "h1", text: "Empleados"
  end

  test "creating a Empleado" do
    visit empleados_url
    click_on "New Empleado"

    fill_in "Actualizado por", with: @empleado.actualizado_por
    fill_in "Apellido materno", with: @empleado.apellido_materno
    fill_in "Apellido paterno", with: @empleado.apellido_paterno
    fill_in "Creado por", with: @empleado.creado_por
    fill_in "Email", with: @empleado.email
    fill_in "Empresa", with: @empleado.empresa_id
    fill_in "Estado", with: @empleado.estado
    fill_in "Nombre", with: @empleado.nombre
    fill_in "Rol", with: @empleado.rol
    fill_in "Rol", with: @empleado.rol_id
    fill_in "Rut", with: @empleado.rut
    fill_in "Usuario", with: @empleado.usuario_id
    click_on "Create Empleado"

    assert_text "Empleado was successfully created"
    click_on "Back"
  end

  test "updating a Empleado" do
    visit empleados_url
    click_on "Edit", match: :first

    fill_in "Actualizado por", with: @empleado.actualizado_por
    fill_in "Apellido materno", with: @empleado.apellido_materno
    fill_in "Apellido paterno", with: @empleado.apellido_paterno
    fill_in "Creado por", with: @empleado.creado_por
    fill_in "Email", with: @empleado.email
    fill_in "Empresa", with: @empleado.empresa_id
    fill_in "Estado", with: @empleado.estado
    fill_in "Nombre", with: @empleado.nombre
    fill_in "Rol", with: @empleado.rol
    fill_in "Rol", with: @empleado.rol_id
    fill_in "Rut", with: @empleado.rut
    fill_in "Usuario", with: @empleado.usuario_id
    click_on "Update Empleado"

    assert_text "Empleado was successfully updated"
    click_on "Back"
  end

  test "destroying a Empleado" do
    visit empleados_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Empleado was successfully destroyed"
  end
end
