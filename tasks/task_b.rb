# :nodoc:
class TaskB < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def initialize(options = {})
    @error = options[:error]
  end

  def handle
    puts 'Task B starts'
    raise 'Error in task B' if @error
    sleep 5
    puts 'Task B ends'

    1
  end
end
