# require '/models/robot_manager'

class RobotManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_manager.all
    erb :robots
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_manager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :edit
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id.to_i)
    erb :show
  end

  put '/robots/:id' do |id|
     robot_manager.update(id.to_i, params[:robot])
     redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    robot_manager.destroy(id.to_i)
    redirect '/robots'
  end

  def robot_manager
    if ENV['RACK_ENV'] == "test"
      database = SQLite3::Database.new("db/robot_manager_test.db")
    else
      database = SQLite3::Database.new("db/robot_manager_development.db")
    end
    database.results_as_hash = true
    @robot_manager ||= RobotManager.new(database)
  end
end
