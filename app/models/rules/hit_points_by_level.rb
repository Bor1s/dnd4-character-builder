class Rules::HitPointsByLevel < Rules::Base
  def process
    return result if satisfied_condition? 
  end
end
