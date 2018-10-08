# :nodoc:
class TaskE < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task E starts'
    raise 'Error in task E'
    puts 'Task E ends'
  end
end
