
class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true  # this allows us to use _method in the form


  get '/' do
       erb :dashboard
  end

  get '/tasks' do
    @tasks = TaskManager.all
         erb :index
  end
end
