# :nodoc:
class TaskB < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task B starts'
    sleep 5
    puts 'Task B ends'

    1
  end
end
