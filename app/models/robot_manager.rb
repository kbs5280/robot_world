require_relative 'robot'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database  = database
  end

  def create(robot)
    database.execute("INSERT INTO robots (name, city, state, avatar, birthdate, date_hired, department)
      VALUES (?, ?, ?, ?, ?, ?, ?);", robot[:name], robot[:city], robot[:state], robot[:avatar], robot[:birthdate], robot[:date_hired], robot[:department])
    # database.transaction do
    #   database[:robots] ||= []
    #   database[:total] ||= 0
    #   database[:total] += 1
    #   database[:robots] << {  id:         database[:total],
    #                           name:       robot["name"],
    #                           city:       robot["city"],
    #                           state:      robot["state"],
    #                           avatar:     robot["avatar"],
    #                           birthdate:  robot["birthdate"],
    #                           date_hired: robot["date_hired"],
    #                           department: robot["department"] }
    # end
  end

  def all
    database.execute("SELECT * FROM robots;")
    # database.transaction do
    #   database[:robots] || []
    # end
  end

  # def all
  #   # database.execute("SELECT * FROM robots;")
  #   raw_robots.map { |robot| Robot.new(robot) }
  # end

  def raw_robot(id)
    raw_robots.find { |robot| robot[:id] == id }
  end

  def find(id)
    robot = Robot.new(all.find do  |robot|
      robot["id"] == id
    end)
  end

  def update(id, robot)
    database.execute("UPDATE robots SET name= ?, city= ?, state= ?, avatar= ?, birthdate= ?, date_hired= ?, department= ?
    WHERE id= ?;", robot[:name], robot[:city], robot[:state], robot[:avatar], robot[:birthdate], robot[:date_hired], robot[:department], id)
  #  database.transaction do
  #    target = database[:robots].find { |data| data[:id] == id }
  #    target[:name]        = robot[:name]
  #    target[:city]        = robot[:city]
  #    target[:state]       = robot[:state]
  #    target[:avatar]      = robot[:avatar]
  #    target[:birthdate]   = robot[:birthdate]
  #    target[:date_hired]  = robot[:date_hired]
  #    target[:department]  = robot[:department]
  #  end
  end

  def destroy(id)
    database.execute("DELETE FROM robots WHERE id= ?;", id)
    # database.transaction do
    #   database[:robots].delete_if { |robot| robot[:id] == id }
    # end
  end

  def delete_all
    database.execute("DELETE FROM robots;")
    # database.transaction do
    #   database['robots']  = []
    #   database['total']   = 0
    # end
  end
end
