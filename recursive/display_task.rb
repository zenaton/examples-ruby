# :nodoc:
class DisplayTask < Zenaton::Interfaces::Task
  include Zenaton::Traits::Zenatonable

  def initialize(counter)
    @counter = counter
  end

  def handle
    puts @counter
    sleep 1
  end
end
