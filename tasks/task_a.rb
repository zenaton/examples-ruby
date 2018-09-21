# :nodoc:
class TaskA < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task A starts'
    sleep 3
    puts 'Task A ends'

    0
  end
end
