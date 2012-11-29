class Rules::Base #< ActiveRecord::Base
  def result
    raise 'Override in subclasses!'
  end

  def condition_satisfied?
    raise 'Override in subclasses!'
  end
end
