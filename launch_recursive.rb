require './client'
require './recursive/recursive_workflow'

RecursiveWorkflow.new(0, 10).dispatch
