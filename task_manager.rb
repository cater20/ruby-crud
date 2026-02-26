class TaskManager
  def initialize
    @tasks = []
  end

  def add_task(title)
    @tasks << { id: @tasks.length + 1, title: title, completed: false }
    puts "Task added successfully!"
  end

  def list_tasks
    if @tasks.empty?
      puts "No tasks available."
    else
      @tasks.each do |task|
        status = task[:completed] ? "✅" : "❌"
        puts "#{task[:id]}. #{task[:title]} [#{status}]"
      end
    end
  end

  def complete_task(id)
    task = @tasks.find { |t| t[:id] == id }
    if task
      task[:completed] = true
      puts "Task marked as completed!"
    else
      puts "Task not found."
    end
  end

  def delete_task(id)
    @tasks.reject! { |t| t[:id] == id }
    puts "Task deleted!"
  end
end   # 👈 Class ends here


# 👇 Everything below is OUTSIDE the class

manager = TaskManager.new

loop do
  puts "\n==== Task Manager ===="
  puts "1. Add Task"
  puts "2. List Tasks"
  puts "3. Complete Task"
  puts "4. Delete Task"
  puts "5. Exit"
  print "Choose an option: "

  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter task title: "
    title = gets.chomp
    manager.add_task(title)
  when 2
    manager.list_tasks
  when 3
    print "Enter task ID to complete: "
    id = gets.chomp.to_i
    manager.complete_task(id)
  when 4
    print "Enter task ID to delete: "
    id = gets.chomp.to_i
    manager.delete_task(id)
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option."
  end
end
