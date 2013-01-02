class Command
  attr_accessor :queue

  def initialize
    @queue ||= []
  end

  def execute
    queue.each do |obj|
      obj.call
    end
    @queue = []
  end

  def add_to_queue(proc_obj)
    @queue << proc_obj
  end
end
