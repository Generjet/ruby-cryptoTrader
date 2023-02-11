require "test_helper"

class AssetsMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assets_movement = assets_movements(:one)
  end

  test "should get index" do
    get assets_movements_url
    assert_response :success
  end

  test "should get new" do
    get new_assets_movement_url
    assert_response :success
  end

  test "should create assets_movement" do
    assert_difference("AssetsMovement.count") do
      post assets_movements_url, params: { assets_movement: { edited_by: @assets_movement.edited_by, from_who: @assets_movement.from_who, it_asset: @assets_movement.it_asset, registered_by: @assets_movement.registered_by, to_who: @assets_movement.to_who } }
    end

    assert_redirected_to assets_movement_url(AssetsMovement.last)
  end

  test "should show assets_movement" do
    get assets_movement_url(@assets_movement)
    assert_response :success
  end

  test "should get edit" do
    get edit_assets_movement_url(@assets_movement)
    assert_response :success
  end

  test "should update assets_movement" do
    patch assets_movement_url(@assets_movement), params: { assets_movement: { edited_by: @assets_movement.edited_by, from_who: @assets_movement.from_who, it_asset: @assets_movement.it_asset, registered_by: @assets_movement.registered_by, to_who: @assets_movement.to_who } }
    assert_redirected_to assets_movement_url(@assets_movement)
  end

  test "should destroy assets_movement" do
    assert_difference("AssetsMovement.count", -1) do
      delete assets_movement_url(@assets_movement)
    end

    assert_redirected_to assets_movements_url
  end
end
