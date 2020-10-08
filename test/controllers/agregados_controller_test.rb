require 'test_helper'

class AgregadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @agregado = agregados(:one)
  end

  test "should get index" do
    get agregados_url
    assert_response :success
  end

  test "should get new" do
    get new_agregado_url
    assert_response :success
  end

  test "should create agregado" do
    assert_difference('Agregado.count') do
      post agregados_url, params: { agregado: { actualizado_por: @agregado.actualizado_por, adicional_id: @agregado.adicional_id, creado_por: @agregado.creado_por, detalle_pedido_id: @agregado.detalle_pedido_id, estado: @agregado.estado } }
    end

    assert_redirected_to agregado_url(Agregado.last)
  end

  test "should show agregado" do
    get agregado_url(@agregado)
    assert_response :success
  end

  test "should get edit" do
    get edit_agregado_url(@agregado)
    assert_response :success
  end

  test "should update agregado" do
    patch agregado_url(@agregado), params: { agregado: { actualizado_por: @agregado.actualizado_por, adicional_id: @agregado.adicional_id, creado_por: @agregado.creado_por, detalle_pedido_id: @agregado.detalle_pedido_id, estado: @agregado.estado } }
    assert_redirected_to agregado_url(@agregado)
  end

  test "should destroy agregado" do
    assert_difference('Agregado.count', -1) do
      delete agregado_url(@agregado)
    end

    assert_redirected_to agregados_url
  end
end
