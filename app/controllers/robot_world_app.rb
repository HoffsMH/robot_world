
class RobotWorldApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true  # this allows us to use _method in the form


  get '/' do
    erb :index
  end

  not_found do
    erb :error
  end

end
