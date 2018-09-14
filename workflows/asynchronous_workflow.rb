require './tasks/task_a'
require './tasks/task_b'

# :nodoc:
class AsynchronousWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    TaskB.new.dispatch
    TaskA.new.execute
  end
end
