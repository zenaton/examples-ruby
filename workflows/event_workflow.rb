require './tasks/task_a'
require './tasks/task_b'
require './tasks/task_c'
require './tasks/task_d'
require './events/my_event'

# :nodoc:
class EventWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  attr_reader :id

  def initialize(id)
    @id = id
    @state = true
  end

  def handle
    TaskA.new.execute
    if @state
      TaskB.new.execute
    else
      TaskC.new.execute
    end
  end

  def on_event(event)
    @state = false if event.is_a?(MyEvent)
  end
end
