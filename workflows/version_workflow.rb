require './workflows/version_workflow_v0'
require './workflows/version_workflow_v1'
require './workflows/version_workflow_v2'

# :nodoc:
class VersionWorkflow < Zenaton::Workflows::Version
  def versions
    [
      VersionWorkflowV0,
      VersionWorkflowV1,
      VersionWorkflowV2
    ]
  end
end
