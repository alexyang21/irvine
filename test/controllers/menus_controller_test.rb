require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  fixtures :menus
  fixtures :restaurants

  setup do
    @menu = menus(:one)
    @update = {
      name:           "Lorem ipsum",
      description:    "Japanese",
      price:          9.99,
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu" do
    assert_difference('Menu.count') do
      post :create, restaurant_id: restaurants(:micks).id, menu: @update
    end

    assert_redirected_to restaurant_menu_path(restaurants(:micks).id, assigns(:menus))
  end

  test "should show menu" do
    get :show, id: @menu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu
    assert_response :success
  end

  test "should update menu" do
    patch :update, id: @menu, menu: { description: @menu.description, name: @menu.name, price: @menu.price }
    assert_redirected_to menu_path(assigns(:menu))
  end

  test "should destroy menu" do
    assert_difference('Menu.count', -1) do
      delete :destroy, id: @menu
    end

    assert_redirected_to restaurant_menus_path
  end
end
