# :nodoc:
class TaskA < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task A'
    sleep 3
    'Task A'
  end
end
