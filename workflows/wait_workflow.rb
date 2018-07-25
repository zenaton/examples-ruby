require './tasks/task_a'
require './tasks/task_b'

# :nodoc:
class WaitWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    TaskA.new.execute
    Zenaton::Tasks::Wait.new.seconds(5).execute
    TaskB.new.execute
  end
end
