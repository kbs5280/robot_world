require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes_correctly
    robot = Robot.new({
       :id=>11,
       :name=>"Taylor S.",
       :city=>"Kansas City",
       :state=>"Missouri",
       :avatar=>"dontdoit",
       :birthdate=>"12/8/2015",
       :date_hired=>"12/9/2015",
       :department=>"Sanitation & Warfare"})

    assert_instance_of Robot, robot
    assert_equal 11, robot.id
    assert_equal "Taylor S.", robot.name
  end
end
