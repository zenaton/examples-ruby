require './client'
require './workflows/event_workflow'
require './events/my_event'

EventWorkflow.new.dispatch

sleep 1

EventWorkflow.where_id('MyId').send_event(MyEvent.new)
