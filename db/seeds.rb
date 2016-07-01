require 'sqlite3'

database = SQLite3::Database.new("db/robot_manager_development.db")

#Delete existing records from the robots table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM robots;")

# Insert records.
database.execute(
                "INSERT INTO robots
          (name, city, state, avatar, birthdate, date_hired, department)
        VALUES
          ('Hector', 'Dallas', 'TX', 'avatar', '12/08/77', '12/09/77', 'Management' );"
)

# verifying that our SQL INSERT statement worked
puts "It worked and:"
p database.execute("SELECT * FROM robots;")
