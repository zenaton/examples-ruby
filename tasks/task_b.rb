# :nodoc:
class TaskB < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task B'
    sleep 5
    'Task B'
  end
end
