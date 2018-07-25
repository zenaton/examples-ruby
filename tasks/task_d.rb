# :nodoc:
class TaskD < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'Task D'
    sleep 9
    'Task D'
  end
end
