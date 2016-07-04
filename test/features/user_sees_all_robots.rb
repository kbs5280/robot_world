require_relative '../test_helper'

class UserSeesRobotInventoryTest < FeatureTest
  include TestHelpers

  def test_user_sees_robot_inventory
    task1 = robot_manager.create({
      name: "Jorge",
      city: "New Orleans",
      state: "LA",
      avatar: "avatar_Jorge",
      birthdate: "12/08/1990",
      date_hired: "12/09/1990",
      deparment: "Logistics"
      })
    task1 = robot_manager.create({
      name: "Juan",
      city: "Shreveport",
      state: "LA",
      avatar: "avatar_juan",
      birthdate: "12/08/1790",
      date_hired: "12/09/1790",
      deparment: "Linguistics"
      })
    # As a user
    # When I vist the robots index
    visit "/robots"
    # Then I should see a list of my robots
    within("#robot_inventory") do
      assert page.has_content?("Jorge")
      assert page.has_content?("Juan")
    end
  end
end
