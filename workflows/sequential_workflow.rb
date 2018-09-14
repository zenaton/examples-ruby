require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'

# :nodoc:
class SequentialWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    a = TaskA.new.execute

    if (0 < a)
        TaskB.new.execute
    else
        TaskC.new.execute
    end
  end
end
