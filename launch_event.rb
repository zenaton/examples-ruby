require './client'
require './workflows/event_workflow'
require './events/my_event'

EventWorkflow.new('MyId').dispatch

sleep 2

EventWorkflow.where_id('MyId').send_event(MyEvent.new)
