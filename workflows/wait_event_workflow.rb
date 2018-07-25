require './tasks/task_a'
require './tasks/task_b'
require './events/my_event'

# :nodoc:
class WaitEventWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  def handle
    event = Zenaton::Tasks::Wait.new(MyEvent).seconds(4).execute
    if event
      TaskA.new.execute
    else
      TaskB.new.execute
    end
  end

  def id
    'MyId'
  end
end
