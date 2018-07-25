require './tasks/task_a'
require './tasks/task_b'

# :nodoc:
class SequentialWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    [
      TaskA.new.execute,
      TaskB.new.execute
    ]
  end
end
