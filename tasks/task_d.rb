# :nodoc:
class TaskD < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task D starts'
    sleep 9
    puts 'Task D ends'

    3
  end
end
