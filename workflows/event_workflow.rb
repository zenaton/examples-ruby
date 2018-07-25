require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'
require './events/my_event'

# :nodoc:
class EventWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    [
      TaskA.new.execute,
      TaskB.new.execute
    ]
  end

  def on_event(event)
    TaskC.new.execute if event.is_a?(MyEvent)
  end

  def id
    'MyId'
  end
end
