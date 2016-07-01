require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_manager.create({"name"=>"Hector",
                          "city"=>"Juarez",
                          "state"=>"Mexico",
                          "avatar"=>"yes",
                          "birthdate"=>"12/12/12",
                          "date_hired"=>"12/13/12",
                          "department"=>"Upper Management"})

    robot = robot_manager.find(robot_manager.all.count)

    assert_instance_of Robot, robot
    assert_equal "Hector", robot.name
    assert_equal "Mexico", robot.state
    binding.pry
  end

  # def test_raw_robots
  #   robot_manager.raw_robots
  # end
  #

end
