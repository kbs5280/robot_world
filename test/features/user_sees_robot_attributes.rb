require_relative '../test_helper'

class UserSeesRobotAttributesTest < FeatureTest
  include TestHelpers

  def test_user_sees_robot_attributes
    task1 = robot_manager.create({
      name: "Jorge",
      city: "New Orleans",
      state: "LA",
      avatar: "avatar_jorge",
      birthdate: "12/08/1990",
      date_hired: "12/09/1990",
      department: "Logistics"
      })
    task1 = robot_manager.create({
      name: "Juan",
      city: "Shreveport",
      state: "LA",
      avatar: "avatar_juan",
      birthdate: "12/08/1790",
      date_hired: "12/09/1790",
      department: "Linguistics"
      })
    # As a user
    # When I vist the robots index
    visit "/robots"
    # And I click on the robot name
    click_link "Jorge"
    # Then I should see a list of my robots attributes
    within("#robot_attributes") do
      assert page.has_content?("Jorge")
      assert page.has_content?("New Orleans")
      assert page.has_content?("avatar_jorge")
      assert page.has_content?("12/08/1990")
      assert page.has_content?("Logistics")
    end
  end
end
