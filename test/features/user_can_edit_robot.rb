require_relative '../test_helper'

class UserCanEditRobotTest < FeatureTest
  include TestHelpers

  def test_user_can_edit_robot
    task1 = robot_manager.create({
      name: "Jorge",
      city: "New Orleans",
      state: "LA",
      birthdate: "12/08/1990",
      date_hired: "12/09/1990",
      department: "Logistics"
      })
    # As a user
    # When I visit the robots page
    visit "/robots"
    assert page.has_content?("Jorge")
    # And I click on the edit button
    click_link "Edit"
    # I should be on the edit page and I fill in the name field with new name
    fill_in 'robot[name]', with: 'Juan'
    # # And I click the submit button
    click_button 'Submit'
    # # Then I should return to the robot attributs page and see a list of my robots attributes
    within("#robot_attributes") do
      assert page.has_content?("Juan")
      assert page.has_content?("New Orleans")
      assert page.has_content?("12/08/1990")
      assert page.has_content?("Logistics")
    end
  end

end
