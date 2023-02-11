require "application_system_test_case"

class AssetsOwnersTest < ApplicationSystemTestCase
  setup do
    @assets_owner = assets_owners(:one)
  end

  test "visiting the index" do
    visit assets_owners_url
    assert_selector "h1", text: "Assets owners"
  end

  test "should create assets owner" do
    visit assets_owners_url
    click_on "New assets owner"

    fill_in "Comment", with: @assets_owner.comment
    fill_in "Department", with: @assets_owner.department
    fill_in "Desktopmodel", with: @assets_owner.desktopModel
    fill_in "Desktopserial", with: @assets_owner.desktopSerial
    fill_in "Dockingstation", with: @assets_owner.dockingStation
    fill_in "Email", with: @assets_owner.email
    fill_in "Laptop", with: @assets_owner.laptop
    fill_in "Laptopserial", with: @assets_owner.laptopSerial
    fill_in "Location", with: @assets_owner.location
    fill_in "Monitor1", with: @assets_owner.monitor1
    fill_in "Monitor2", with: @assets_owner.monitor2
    fill_in "Monitor3", with: @assets_owner.monitor3
    fill_in "Name", with: @assets_owner.name
    fill_in "Position", with: @assets_owner.position
    fill_in "Sap", with: @assets_owner.sap_id
    fill_in "Surname", with: @assets_owner.surname
    click_on "Create Assets owner"

    assert_text "Assets owner was successfully created"
    click_on "Back"
  end

  test "should update Assets owner" do
    visit assets_owner_url(@assets_owner)
    click_on "Edit this assets owner", match: :first

    fill_in "Comment", with: @assets_owner.comment
    fill_in "Department", with: @assets_owner.department
    fill_in "Desktopmodel", with: @assets_owner.desktopModel
    fill_in "Desktopserial", with: @assets_owner.desktopSerial
    fill_in "Dockingstation", with: @assets_owner.dockingStation
    fill_in "Email", with: @assets_owner.email
    fill_in "Laptop", with: @assets_owner.laptop
    fill_in "Laptopserial", with: @assets_owner.laptopSerial
    fill_in "Location", with: @assets_owner.location
    fill_in "Monitor1", with: @assets_owner.monitor1
    fill_in "Monitor2", with: @assets_owner.monitor2
    fill_in "Monitor3", with: @assets_owner.monitor3
    fill_in "Name", with: @assets_owner.name
    fill_in "Position", with: @assets_owner.position
    fill_in "Sap", with: @assets_owner.sap_id
    fill_in "Surname", with: @assets_owner.surname
    click_on "Update Assets owner"

    assert_text "Assets owner was successfully updated"
    click_on "Back"
  end

  test "should destroy Assets owner" do
    visit assets_owner_url(@assets_owner)
    click_on "Destroy this assets owner", match: :first

    assert_text "Assets owner was successfully destroyed"
  end
end
