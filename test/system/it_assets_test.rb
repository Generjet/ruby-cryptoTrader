require "application_system_test_case"

class ItAssetsTest < ApplicationSystemTestCase
  setup do
    @it_asset = it_assets(:one)
  end

  test "visiting the index" do
    visit it_assets_url
    assert_selector "h1", text: "It assets"
  end

  test "should create it asset" do
    visit it_assets_url
    click_on "New it asset"

    fill_in "Asset type", with: @it_asset.asset_type
    fill_in "Detail", with: @it_asset.detail
    fill_in "Edited by", with: @it_asset.edited_by
    fill_in "Name", with: @it_asset.name
    fill_in "Owner", with: @it_asset.owner_id
    fill_in "Registered by", with: @it_asset.registered_by
    fill_in "Serial number", with: @it_asset.serial_number
    fill_in "Status", with: @it_asset.status
    click_on "Create It asset"

    assert_text "It asset was successfully created"
    click_on "Back"
  end

  test "should update It asset" do
    visit it_asset_url(@it_asset)
    click_on "Edit this it asset", match: :first

    fill_in "Asset type", with: @it_asset.asset_type
    fill_in "Detail", with: @it_asset.detail
    fill_in "Edited by", with: @it_asset.edited_by
    fill_in "Name", with: @it_asset.name
    fill_in "Owner", with: @it_asset.owner_id
    fill_in "Registered by", with: @it_asset.registered_by
    fill_in "Serial number", with: @it_asset.serial_number
    fill_in "Status", with: @it_asset.status
    click_on "Update It asset"

    assert_text "It asset was successfully updated"
    click_on "Back"
  end

  test "should destroy It asset" do
    visit it_asset_url(@it_asset)
    click_on "Destroy this it asset", match: :first

    assert_text "It asset was successfully destroyed"
  end
end
