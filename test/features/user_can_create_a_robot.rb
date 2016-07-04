require_relative '../test_helper'

class UserCanCreateARobotTest < FeatureTest
  include TestHelpers

  def test_user_can_create_a_robot
    # As a user
    # When I visit the dashboard page
    visit "/"
    # And I click the link to create a new task
    click_link "Make ROBOOOOOOOOOT!"
    # Then I should be on the new tasks page
    assert_equal "/robots/new", current_path
    # And I fill in the robot field
    fill_in "robot[name]", with: "Eddie"
    # And I fill in the desc field with a desc
    fill_in "robot[city]", with: "New York"
    # And I click the submit button
    click_button("Build It!")
    assert_equal "/robots", current_path
    # Then I should see the list of task I created and a All Tasks header
    assert page.has_css?(".navbar-static-top")
    assert page.has_content?("Welcome to Robot Inventory")
  end
end
