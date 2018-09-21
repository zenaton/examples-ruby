require 'securerandom'
require './client'
require './workflows/wait_event_workflow'
require './events/my_event'

id = SecureRandom.hex(5)

WaitEventWorkflow.new(id).dispatch

sleep 2

WaitEventWorkflow.where_id(id).send_event(MyEvent.new)
