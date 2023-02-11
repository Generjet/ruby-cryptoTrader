require "test_helper"

class ItAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @it_asset = it_assets(:one)
  end

  test "should get index" do
    get it_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_it_asset_url
    assert_response :success
  end

  test "should create it_asset" do
    assert_difference("ItAsset.count") do
      post it_assets_url, params: { it_asset: { asset_type: @it_asset.asset_type, detail: @it_asset.detail, edited_by: @it_asset.edited_by, name: @it_asset.name, owner_id: @it_asset.owner_id, registered_by: @it_asset.registered_by, serial_number: @it_asset.serial_number, status: @it_asset.status } }
    end

    assert_redirected_to it_asset_url(ItAsset.last)
  end

  test "should show it_asset" do
    get it_asset_url(@it_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_it_asset_url(@it_asset)
    assert_response :success
  end

  test "should update it_asset" do
    patch it_asset_url(@it_asset), params: { it_asset: { asset_type: @it_asset.asset_type, detail: @it_asset.detail, edited_by: @it_asset.edited_by, name: @it_asset.name, owner_id: @it_asset.owner_id, registered_by: @it_asset.registered_by, serial_number: @it_asset.serial_number, status: @it_asset.status } }
    assert_redirected_to it_asset_url(@it_asset)
  end

  test "should destroy it_asset" do
    assert_difference("ItAsset.count", -1) do
      delete it_asset_url(@it_asset)
    end

    assert_redirected_to it_assets_url
  end
end
