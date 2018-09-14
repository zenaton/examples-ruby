# :nodoc:
class TaskC < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task C starts'
    sleep 7
    puts 'Task C ends'

    2
  end
end
