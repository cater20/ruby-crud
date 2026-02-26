require 'sinatra'
require 'json'

tasks = []

# Home route
get '/' do
  "Task Manager API Running 🚀"
end

# Get all tasks
get '/tasks' do
  content_type :json
  tasks.to_json
end

# Add task
post '/tasks' do
  data = JSON.parse(request.body.read)
  task = {
    id: tasks.length + 1,
    title: data["title"],
    completed: false
  }
  tasks << task
  task.to_json
end

# Complete task
put '/tasks/:id' do
  task = tasks.find { |t| t[:id] == params[:id].to_i }
  halt 404, "Task not found" unless task
  task[:completed] = true
  task.to_json
end

# Delete task
delete '/tasks/:id' do
  tasks.reject! { |t| t[:id] == params[:id].to_i }
  { message: "Deleted" }.to_json
end
