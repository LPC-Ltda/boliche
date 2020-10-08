require 'test_helper'

class AdicionalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adicional = adicionales(:one)
  end

  test "should get index" do
    get adicionales_url
    assert_response :success
  end

  test "should get new" do
    get new_adicional_url
    assert_response :success
  end

  test "should create adicional" do
    assert_difference('Adicional.count') do
      post adicionales_url, params: { adicional: { actualizado_por: @adicional.actualizado_por, adicional: @adicional.adicional, creado_por: @adicional.creado_por, estado: @adicional.estado, precio: @adicional.precio } }
    end

    assert_redirected_to adicional_url(Adicional.last)
  end

  test "should show adicional" do
    get adicional_url(@adicional)
    assert_response :success
  end

  test "should get edit" do
    get edit_adicional_url(@adicional)
    assert_response :success
  end

  test "should update adicional" do
    patch adicional_url(@adicional), params: { adicional: { actualizado_por: @adicional.actualizado_por, adicional: @adicional.adicional, creado_por: @adicional.creado_por, estado: @adicional.estado, precio: @adicional.precio } }
    assert_redirected_to adicional_url(@adicional)
  end

  test "should destroy adicional" do
    assert_difference('Adicional.count', -1) do
      delete adicional_url(@adicional)
    end

    assert_redirected_to adicionales_url
  end
end
