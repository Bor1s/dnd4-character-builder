class Rules::Base #< ActiveRecord::Base
  attr_accessor :name, :actions, :result, :conditions

  def process
    raise 'Override in subclasses!'
  end

  def satisfied_condition?
    !!eval("left operator right")
  end

  private

  def left
    conditions[:left]
  end

  def right
    conditions[:right]
  end

  def operator
    conditions[:operator]
  end
end
