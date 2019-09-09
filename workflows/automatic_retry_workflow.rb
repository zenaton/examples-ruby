require './tasks/task_with_retry'

# :nodoc:
class AutomaticRetryWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    TaskWithRetry.new.execute
  end
end
