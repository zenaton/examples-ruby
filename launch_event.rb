require 'securerandom'

require './client'
require './workflows/event_workflow'
require './events/my_event'

id = SecureRandom.hex(5)

EventWorkflow.new(id).dispatch

sleep 2

EventWorkflow.where_id(id).send_event(MyEvent.new)
