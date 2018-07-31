require './client'
require './recursive/recursive_workflow'

RecursiveWorkflow.where_id(ARGV[0]).kill
