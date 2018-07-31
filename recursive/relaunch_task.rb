# :nodoc:
class RelaunchTask < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def initialize(id, max)
    @id = id
    @max = max
  end

  def handle
    if @id < @max
      @id += 1
      puts "\nIteration: #{@id}"
      RecursiveWorkflow.new(@id, @max).dispatch
    end
  end
end
