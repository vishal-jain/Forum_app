require 'test_helper'

class AddTaggedTablesControllerTest < ActionController::TestCase
  setup do
    @add_tagged_table = add_tagged_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:add_tagged_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create add_tagged_table" do
    assert_difference('AddTaggedTable.count') do
      post :create, add_tagged_table: { description: @add_tagged_table.description, name: @add_tagged_table.name }
    end

    assert_redirected_to add_tagged_table_path(assigns(:add_tagged_table))
  end

  test "should show add_tagged_table" do
    get :show, id: @add_tagged_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @add_tagged_table
    assert_response :success
  end

  test "should update add_tagged_table" do
    put :update, id: @add_tagged_table, add_tagged_table: { description: @add_tagged_table.description, name: @add_tagged_table.name }
    assert_redirected_to add_tagged_table_path(assigns(:add_tagged_table))
  end

  test "should destroy add_tagged_table" do
    assert_difference('AddTaggedTable.count', -1) do
      delete :destroy, id: @add_tagged_table
    end

    assert_redirected_to add_tagged_tables_path
  end
end
