require './recursive/display_task'
require './recursive/send_event_task'
require './recursive/relaunch_task'
require './recursive/ending_event'

# :nodoc:
class RecursiveWorkflow < Zenaton::Interfaces::Workflow
  include Zenaton::Traits::Zenatonable

  attr_reader :id

  def initialize(id, max)
    @id = id
    @max = max
  end

  def handle
    counter = 0
    while counter < 10
      DisplayTask.new(counter).execute
      counter += 1
    end
    SendEventTask.new(@id).dispatch
    Zenaton::Tasks::Wait.new(EndingEvent).execute
    RelaunchTask.new(@id, @max).dispatch
  end
end
