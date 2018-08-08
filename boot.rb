# Write to stdout immediately
STDOUT.sync = true

require './client'
require './workflows/sequential_workflow'
require './workflows/parallel_workflow'
require './workflows/asynchronous_workflow'
require './workflows/wait_workflow'
require './workflows/wait_event_workflow'
require './workflows/event_workflow'
require './workflows/version_workflow'
require './recursive/recursive_workflow'
