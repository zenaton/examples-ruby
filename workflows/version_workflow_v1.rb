require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'

# :nodoc:
class VersionWorkflowV1 < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    Zenaton::Parallel.new(
      TaskA.new,
      TaskB.new,
      TaskC.new
    ).execute
  end
end
