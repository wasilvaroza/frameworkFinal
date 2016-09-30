require 'test_helper'

class AtividadesControllerTest < ActionController::TestCase
  setup do
    @atividade = atividades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atividades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atividade" do
    assert_difference('Atividade.count') do
      post :create, atividade: { assunto: @atividade.assunto, dataHora_fim: @atividade.dataHora_fim, dataHora_inicio: @atividade.dataHora_inicio, evento_id: @atividade.evento_id, local: @atividade.local, resumo: @atividade.resumo, tipo: @atividade.tipo, tituloatividade: @atividade.tituloatividade }
    end

    assert_redirected_to atividade_path(assigns(:atividade))
  end

  test "should show atividade" do
    get :show, id: @atividade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atividade
    assert_response :success
  end

  test "should update atividade" do
    patch :update, id: @atividade, atividade: { assunto: @atividade.assunto, dataHora_fim: @atividade.dataHora_fim, dataHora_inicio: @atividade.dataHora_inicio, evento_id: @atividade.evento_id, local: @atividade.local, resumo: @atividade.resumo, tipo: @atividade.tipo, tituloatividade: @atividade.tituloatividade }
    assert_redirected_to atividade_path(assigns(:atividade))
  end

  test "should destroy atividade" do
    assert_difference('Atividade.count', -1) do
      delete :destroy, id: @atividade
    end

    assert_redirected_to atividades_path
  end
end
