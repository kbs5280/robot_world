require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_manager.create({
                          name: "Hector",
                          city: "Juarez",
                          state: "Mexico",
                          avatar: "yes",
                          birthdate: "12/12/12",
                          date_hired: "12/13/12",
                          department: "Upper Management"
                        })

    robot = robot_manager.find(robot_manager.all.first["id"])

    assert_instance_of Robot, robot
    assert_equal "Hector", robot.name
    assert_equal "Mexico", robot.state
  end

  def test_it_finds_a_robot
    task1 = robot_manager.create({
                          name: "Hector",
                          city: "Juarez",
                          state: "Mexico",
                          avatar: "yes",
                          birthdate: "12/12/12",
                          date_hired: "12/13/12",
                          department: "Upper Management"
    })
    task2 = robot_manager.create({
                          name: "Jaime",
                          city: "Mexico City",
                          state: "Mexico",
                          avatar: "yes",
                          birthdate: "12/14/12",
                          date_hired: "12/15/12",
                          department: "Middle Management"
    })

    robot = robot_manager.find(robot_manager.all.first["id"])
    assert_equal "Hector", robot.name
    assert_equal "Upper Management", robot.department
  end

  def test_it_finds_a_robot
    task1 = robot_manager.create({
                          name: "Hector",
                          city: "Juarez",
                          state: "Mexico",
                          avatar: "yes",
                          birthdate: "12/12/12",
                          date_hired: "12/13/12",
                          department: "Upper Management"
    })
    task2 = robot_manager.create({
                          name: "Jaime",
                          city: "Mexico City",
                          state: "Mexico",
                          avatar: "yes",
                          birthdate: "12/14/12",
                          date_hired: "12/15/12",
                          department: "Middle Management"
    })

    robot = robot_manager.find(robot_manager.all.first["id"])
    robot_manager.update(robot_manager.all.first["id"], robot)
  end



end
