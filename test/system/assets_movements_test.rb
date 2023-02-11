require "application_system_test_case"

class AssetsMovementsTest < ApplicationSystemTestCase
  setup do
    @assets_movement = assets_movements(:one)
  end

  test "visiting the index" do
    visit assets_movements_url
    assert_selector "h1", text: "Assets movements"
  end

  test "should create assets movement" do
    visit assets_movements_url
    click_on "New assets movement"

    fill_in "Edited by", with: @assets_movement.edited_by
    fill_in "From who", with: @assets_movement.from_who
    fill_in "It asset", with: @assets_movement.it_asset
    fill_in "Registered by", with: @assets_movement.registered_by
    fill_in "To who", with: @assets_movement.to_who
    click_on "Create Assets movement"

    assert_text "Assets movement was successfully created"
    click_on "Back"
  end

  test "should update Assets movement" do
    visit assets_movement_url(@assets_movement)
    click_on "Edit this assets movement", match: :first

    fill_in "Edited by", with: @assets_movement.edited_by
    fill_in "From who", with: @assets_movement.from_who
    fill_in "It asset", with: @assets_movement.it_asset
    fill_in "Registered by", with: @assets_movement.registered_by
    fill_in "To who", with: @assets_movement.to_who
    click_on "Update Assets movement"

    assert_text "Assets movement was successfully updated"
    click_on "Back"
  end

  test "should destroy Assets movement" do
    visit assets_movement_url(@assets_movement)
    click_on "Destroy this assets movement", match: :first

    assert_text "Assets movement was successfully destroyed"
  end
end
