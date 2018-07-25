# :nodoc:
class TaskC < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task C'
    sleep 7
    'Task C'
  end
end
