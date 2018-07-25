require './recursive/ending_event'

# :nodoc:
class SendEventTask < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def initialize(id)
    @id = id
  end

  def handle
    RecursiveWorkflow.where_id(@id).send_event(EndingEvent.new)
  end
end
