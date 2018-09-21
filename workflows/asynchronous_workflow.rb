require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'
require './tasks/task_d'

# :nodoc:
class AsynchronousWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    TaskA.new.dispatch
    TaskB.new.dispatch
    TaskC.new.execute
    TaskD.new.execute
  end
end
