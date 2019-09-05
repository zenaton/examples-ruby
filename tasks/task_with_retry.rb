# :nodoc:
class TaskWithRetry < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def handle
    puts 'TaskWithRetry starts'
    sleep 3
    raise 'Error in TaskWithRetry'
    puts 'TaskWithRetry ends'
  end

  def on_error_retry_delay(exception)
    # The retry index starts at 1 and increases by one for every retry.
    # This can be used to to increase the time between each attempt.
    n = @context.retry_index
    if n > 3
        false
    else
        n * 5
    end
  end
end
