require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'
require './tasks/task_d'

# :nodoc:
class SequentialWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    a = TaskA.new.execute

    if a > 0
      TaskB.new.execute
    else
      TaskC.new.execute
    end

    TaskD.new.execute
  end
end
