require './tasks/task_a'
require './tasks/task_b'

# :nodoc:
class VersionWorkflowV0 < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    Zenaton::Parallel.new(
      TaskA.new,
      TaskB.new
    ).execute
  end
end
