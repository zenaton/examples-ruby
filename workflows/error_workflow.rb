require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'

# :nodoc:
class ErrorWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    Zenaton::Parallel.new(
      TaskA.new,
      TaskB.new(error: true)
    ).execute

    TaskC.new.execute
  end
end
