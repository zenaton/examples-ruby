require './client'
require './workflows/wait_event_workflow'
require './events/my_event'

WaitEventWorkflow.new('MyId').dispatch

sleep 2

WaitEventWorkflow.where_id('MyId').send_event(MyEvent.new)
