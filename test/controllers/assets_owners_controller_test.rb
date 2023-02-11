require "test_helper"

class AssetsOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assets_owner = assets_owners(:one)
  end

  test "should get index" do
    get assets_owners_url
    assert_response :success
  end

  test "should get new" do
    get new_assets_owner_url
    assert_response :success
  end

  test "should create assets_owner" do
    assert_difference("AssetsOwner.count") do
      post assets_owners_url, params: { assets_owner: { comment: @assets_owner.comment, department: @assets_owner.department, desktopModel: @assets_owner.desktopModel, desktopSerial: @assets_owner.desktopSerial, dockingStation: @assets_owner.dockingStation, email: @assets_owner.email, laptop: @assets_owner.laptop, laptopSerial: @assets_owner.laptopSerial, location: @assets_owner.location, monitor1: @assets_owner.monitor1, monitor2: @assets_owner.monitor2, monitor3: @assets_owner.monitor3, name: @assets_owner.name, position: @assets_owner.position, sap_id: @assets_owner.sap_id, surname: @assets_owner.surname } }
    end

    assert_redirected_to assets_owner_url(AssetsOwner.last)
  end

  test "should show assets_owner" do
    get assets_owner_url(@assets_owner)
    assert_response :success
  end

  test "should get edit" do
    get edit_assets_owner_url(@assets_owner)
    assert_response :success
  end

  test "should update assets_owner" do
    patch assets_owner_url(@assets_owner), params: { assets_owner: { comment: @assets_owner.comment, department: @assets_owner.department, desktopModel: @assets_owner.desktopModel, desktopSerial: @assets_owner.desktopSerial, dockingStation: @assets_owner.dockingStation, email: @assets_owner.email, laptop: @assets_owner.laptop, laptopSerial: @assets_owner.laptopSerial, location: @assets_owner.location, monitor1: @assets_owner.monitor1, monitor2: @assets_owner.monitor2, monitor3: @assets_owner.monitor3, name: @assets_owner.name, position: @assets_owner.position, sap_id: @assets_owner.sap_id, surname: @assets_owner.surname } }
    assert_redirected_to assets_owner_url(@assets_owner)
  end

  test "should destroy assets_owner" do
    assert_difference("AssetsOwner.count", -1) do
      delete assets_owner_url(@assets_owner)
    end

    assert_redirected_to assets_owners_url
  end
end
