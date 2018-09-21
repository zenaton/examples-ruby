require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'
require './tasks/task_d'

# :nodoc:
class ParallelWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    a, b = Zenaton::Parallel.new(
      TaskA.new,
      TaskB.new
    ).execute

    if a > b
      TaskC.new.execute
    else
      TaskD.new.execute
    end
  end
end
